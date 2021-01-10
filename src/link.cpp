#include "link.h"

void Link::run_send()
{
	lk_msg *start = (lk_msg*)((char*)m_buffer + lk_page_size);
	lk_msg *end = (lk_msg*)((char*)start + sizeof(lk_chan));
	lk_msg *msg = start;
	while (m_running)
	{
		if (msg->m_status == lk_chan_status_busy)
		{
			if (send(msg))
			{
				msg->m_status = lk_chan_status_ready;
				if (++msg == end) msg = start;
			}
		}
		else std::this_thread::sleep_for(std::chrono::milliseconds(LINK_POLLING_TIMEOUT));
	}
}

void Link::run_receive()
{
	lk_msg *start = m_buffer;
	lk_msg *end = (lk_msg*)((char*)start + sizeof(lk_chan));
	lk_msg *msg = start;
	while (m_running)
	{
		if (msg->m_status == lk_chan_status_ready)
		{
			if (receive(msg))
			{
				msg->m_status = lk_chan_status_busy;
				if (++msg == end) msg = start;
			}
		}
		else std::this_thread::sleep_for(std::chrono::milliseconds(LINK_POLLING_TIMEOUT));
	}
}
