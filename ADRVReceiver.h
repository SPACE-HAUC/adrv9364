
#ifndef ADRVRECEIVER_H
#define ADRVRECEIVER_H

#include "ADRV.h"

class ADRVReceiver : public ADRV
{
public:
	ADRVReceiver();
	ADRVReceiver(long long bandwidth, long long sampleFreq, long long loFreq,
		const char* radioPort);
	ADRVReceiver(struct stream_cfg* rxCfg);
	~ADRVReceiver();
	void printID();
	void printObject();
	bool configureReceiver();
	void receive(void* rxBuf, uint32_t* RXPKT, uint32_t &bufSize);
private:
	struct stream_cfg receiverConfig;
	struct iio_device* rxDev;
	struct iio_channel* rxChn0_q;
	struct iio_channel* rxChn0_i;
	struct iio_buffer* rxBuffer;
};

#endif
