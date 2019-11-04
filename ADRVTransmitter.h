
#ifndef ADRVTRANSMITTER_H
#define ADRVTRANSMITTER_H

#include "ADRV.h"

class ADRVTransmitter : public ADRV
{
public:
	ADRVTransmitter();
	ADRVTransmitter(long long bandwidth, long long sampleFreq, long long loFreq,
		const char* radioPort);
	~ADRVTransmitter();
	void printID();
	void printObject();
	void transmit(void* txBuf, uint32_t bufSize, uint32_t* TXPKT);
private:
	struct stream_cfg transmitterConfig;
};

#endif
