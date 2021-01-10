#include "usb_link.h"
#include <algorithm>
#include <iostream>

uint32_t jenkins_hash(uint8_t *key, size_t len)
{
	uint32_t hash, i;
	for(hash = i = 0; i < len; ++i)
	{
		hash += key[i];
		hash += (hash << 10);
		hash ^= (hash >> 6);
	}
	hash += (hash << 3);
	hash ^= (hash >> 11);
	hash += (hash << 15);
	return hash;
}

std::unique_ptr<USB_Link> claim_usb_link(lk_msg *buffer)
{
	libusb_device **devices;
	libusb_device *device;
	libusb_device_descriptor device_descriptor;
	libusb_device_handle *handle;
	libusb_get_device_list(nullptr, &devices);
	for (auto i = 0; (device = devices[i++]) != nullptr;)
	{
		if (libusb_get_device_descriptor(device, &device_descriptor) == 0)
		{
			static std::vector<USB_Info> info =
				{{0x67b, 0x25a1, 0x2, 0x3},
				 {0x67b, 0x27a1, 0x8, 0x9}};
			for (auto &i : info)
			{
				if ((device_descriptor.idVendor == i.m_vid)
					&& (device_descriptor.idProduct == i.m_pid))
				{
					if (libusb_open(device, &handle) == LIBUSB_SUCCESS)
					{
						if (libusb_claim_interface(handle, 0) == LIBUSB_SUCCESS)
						{
							auto usb_link = std::make_unique<USB_Link>(i, handle, buffer);
							libusb_free_device_list(devices, 1);
							return usb_link;
						}
						else
						{
							libusb_close(handle);
						}
					}
				}
			}
		}
	}
	libusb_free_device_list(devices, 1);
	return nullptr;
}

void USB_Link_Monitor::run()
{
	libusb_init(nullptr);

	while (m_running)
	{
		//associate any free buffers with link cables
		{
			//hold lock just for this scope
			std::lock_guard<std::mutex> lock(m_mutex);
			for (auto &itr : m_buffer_map)
			{
				if (!itr.second)
				{
					auto usb_link = claim_usb_link(itr.first);
					if (usb_link)
					{
						m_usb_links.emplace_back(std::move(usb_link));
						itr.second = m_usb_links.back().get();
						itr.second->start_thread();
					}
				}			
			}
		}

		std::this_thread::sleep_for(std::chrono::milliseconds(USB_POLLING_TIMEOUT));
	}

	//close open usb links
	for (auto &link : m_usb_links) link->stop_thread();
	for (auto &link : m_usb_links) link->join_thread();
	m_usb_links.clear();

	libusb_exit(nullptr);
}

void USB_Link_Monitor::add_buffer(lk_msg *buffer)
{
	std::lock_guard<std::mutex> lock(m_mutex);
	m_buffer_map[buffer] = nullptr;
}

size_t USB_Link_Monitor::sub_buffer(lk_msg *buffer)
{
	std::lock_guard<std::mutex> lock(m_mutex);
	m_buffer_map.erase(buffer);
	return m_buffer_map.size();
}

bool USB_Link::send(lk_msg *msg)
{
	//calculate the hash value
	auto len = msg->m_stamp.m_frag_length == 0xffffffff ? 0 : msg->m_stamp.m_frag_length;
	msg->m_hash = jenkins_hash((uint8_t*)&msg->m_peer_node_id, offsetof(lk_msg, m_data) - offsetof(lk_msg, m_peer_node_id) + len);

	//send the buffer
	auto error = 0;
	auto bytes_sent = 0;
	len = offsetof(lk_msg, m_data) - offsetof(lk_msg, m_hash) + len;
	do
	{
		error = libusb_bulk_transfer(m_usb_dev_handle, LIBUSB_ENDPOINT_OUT | m_usb_dev_info.m_bulk_out_addr, (uint8_t*)&msg->m_hash, len, &bytes_sent, USB_TRANSFER_TIMEOUT);
	} while (error != LIBUSB_SUCCESS && m_running);
	return error == LIBUSB_SUCCESS ? true : false;
}

bool USB_Link::receive(lk_msg *msg)
{
	//receive the buffer
	auto error = 0;
	auto len = 0;
	do
	{
		error = libusb_bulk_transfer(m_usb_dev_handle, LIBUSB_ENDPOINT_IN | m_usb_dev_info.m_bulk_in_addr, (uint8_t*)&msg->m_hash,
				sizeof(lk_msg) - offsetof(lk_msg, m_hash), &len, USB_TRANSFER_TIMEOUT);
	} while (error != LIBUSB_SUCCESS && m_running);
	if (error != LIBUSB_SUCCESS)
	{
		std::cout << "Error, libusb!" << std::endl;
		return false;
	}

	//test the hash value
	auto hash = jenkins_hash((uint8_t*)&msg->m_peer_node_id, len - sizeof(msg->m_hash));
	if (hash == msg->m_hash) return true;
	std::cout << "Error, msg hash!" << std::endl;
	return false;
}
