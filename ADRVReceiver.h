
#ifndef ADRVRECEIVER_H
#define ADRVRECEIVER_H

#include "ADRV.h"

class ADRVReceiver : public ADRV
{
public:
	ADRVReceiver();
	ADRVReceiver(long long bandwidth, long long sampleFreq, long long loFreq,
		const char* radioPort);
	~ADRVReceiver();
	void printID();
	void printObject();
	void receive(void* rxBuf, uint32_t* RXPKT, uint32_t &bufSize);
private:
	struct stream_cfg receiverConfig;
};

#endif