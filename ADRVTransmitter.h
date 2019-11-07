
#ifndef ADRVTRANSMITTER_H
#define ADRVTRANSMITTER_H

#include "ADRV.h"

class ADRVTransmitter : virtual public ADRV
{
public:
	ADRVTransmitter:ADRV();
	//ADRVTransmitter(long long bandwidth, long long sampleFreq, long long loFreq,
		//const char* radioPort);
	//ADRVTransmitter(struct stream_cfg* txCfg);
	~ADRVTransmitter();
	void printID();
	void printObject();
	void transmit(void* txBuf, uint32_t bufSize, uint32_t* TXPKT);
private:
	struct stream_cfg transmitterConfig;
	struct iio_device* txDev;
};

#endif
