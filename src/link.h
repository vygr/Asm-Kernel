#ifndef LINK_H
#define LINK_H

#include <memory>
#include <mutex>
#include <thread>
#include "pii.h"

const unsigned int LINK_POLLING_TIMEOUT = 1;
const unsigned int USB_POLLING_TIMEOUT = 1000;
const unsigned int USB_TRANSFER_TIMEOUT = 100;

class Link
{
public:
	Link(lk_msg *buffer)
		: m_buffer(buffer)
	{}
	virtual ~Link() {}
	virtual void start_thread()
	{
		m_thread_send = std::thread(&Link::run_send, this);
		m_thread_receive = std::thread(&Link::run_receive, this);
	}
	virtual void join_thread()
	{
		m_thread_send.join();
		m_thread_receive.join();
	}
	virtual void stop_thread() { m_running = false; }
	virtual void run_send();
	virtual void run_receive();
protected:
	virtual bool send(lk_msg *msg) = 0;
	virtual bool receive(lk_msg *msg) = 0;
	bool m_running = true;
	lk_msg *m_buffer;
	std::thread m_thread_send;
	std::thread m_thread_receive;
};

class Link_Monitor
{
public:
	Link_Monitor()
	{}
	virtual ~Link_Monitor() {}
	virtual void start_thread() = 0;
	virtual void stop_thread() { m_running = false; }
	virtual void join_thread() = 0;
	bool m_running = false;
protected:
	virtual void run() = 0;
	std::mutex m_mutex;
};

#endif
