#include "link.h"

void Link::run_send()
{
	lk_msg *start = (lk_msg*)((char*)m_buffer + lk_page_size);
	lk_msg *end = (lk_msg*)((char*)start + sizeof(lk_chan));
	lk_msg *msg = start;
	while (m_running)
	{
		std::this_thread::sleep_for(std::chrono::milliseconds(LINK_POLLING_TIMEOUT));
		auto old_msg = msg;
		while (msg->m_status != lk_chan_status_busy)
		{
			if (++msg == end) msg = start;
			if (msg == old_msg) break;
		}
		while (m_running && msg->m_status == lk_chan_status_busy)
		{
			if (send(msg) != 0) goto exit;
			msg->m_status = lk_chan_status_ready;
			if (++msg == end) msg = start;
		}
	}
exit:
	m_running = false;
}

void Link::run_receive()
{
	lk_msg *start = m_buffer;
	lk_msg *end = (lk_msg*)((char*)start + sizeof(lk_chan));
	lk_msg *msg = start;
	while (m_running)
	{
		std::this_thread::sleep_for(std::chrono::milliseconds(LINK_POLLING_TIMEOUT));
		auto old_msg = msg;
		while (msg->m_status != lk_chan_status_ready)
		{
			if (++msg == end) msg = start;
			if (msg == old_msg) break;
		}
		while (m_running && msg->m_status == lk_chan_status_ready)
		{
			if (receive(msg) != 0) goto exit;
			msg->m_status = lk_chan_status_busy;
			if (++msg == end) msg = start;
		}
	}
exit:
	m_running = false;
}
