#ifndef USB_LINK_H
#define USB_LINK_H

#define NOMINMAX true

#include <thread>
#include <vector>
#include <memory>
#include <map>
#include <string>
#include "libusb.h"
#include "link.h"

struct USB_Info
{
	bool operator==(const USB_Info &p) const
	{
		return std::tie(p.m_vid, p.m_pid) == std::tie(m_vid, m_pid);
	}
	unsigned int m_vid;
	unsigned int m_pid;
	uint8_t m_bulk_out_addr;
	uint8_t m_bulk_in_addr;
};

class USB_Link : public Link
{
public:
	USB_Link(USB_Info &info, libusb_device_handle *handle, lk_msg *buffer)
		: Link(buffer)
		, m_usb_dev_info(info)
		, m_usb_dev_handle(handle)
	{}
	~USB_Link()
	{
		libusb_release_interface(m_usb_dev_handle, 0);
		libusb_close(m_usb_dev_handle);
		m_usb_dev_handle = nullptr;
	}
protected:
	virtual int send(lk_msg *msg) override;
	virtual int receive(lk_msg *msg) override;
private:
	USB_Info m_usb_dev_info;
	libusb_device_handle *m_usb_dev_handle = nullptr;
};

class USB_Link_Monitor : public Link_Monitor
{
public:
	USB_Link_Monitor()
		: Link_Monitor()
	{}
	void start_thread() override { m_thread = std::thread(&USB_Link_Monitor::run, this); m_running = true; }
	void join_thread() override { m_thread.join(); }
	void run() override;
	void add_buffer(lk_msg *buffer);
	size_t sub_buffer(lk_msg *buffer);
private:
	std::vector<std::unique_ptr<USB_Link>> m_usb_links;
	std::map<lk_msg*, USB_Link*> m_buffer_map;
	std::thread m_thread;
};

#endif
