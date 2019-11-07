
#include <iostream>
#include <stdio.h>
#include "ADRVTransmitter.h"

using std::cout;
using std::endl;

ADRVTransmitter::ADRVTransmitter:ADRV()
{
	transmitterConfig.bw_hz = 0;
	transmitterConfig.fs_hz = 0;
	transmitterConfig.lo_hz = 0;
	transmitterConfig.rfport = "NO SELECTION";
	cout << "TX CONST CALLED" << endl;
}

/*ADRVTransmitter::ADRVTransmitter(long long bandwidth, long long sampleFreq,
	long long loFreq, const char* radioPort)
{
	transmitterConfig.bw_hz = bandwidth;
	transmitterConfig.fs_hz = sampleFreq;
	transmitterConfig.lo_hz = loFreq;
	transmitterConfig.rfport = radioPort;
} */

ADRVTransmitter::~ADRVTransmitter()
{

}

void ADRVTransmitter::printID()
{
	cout << "I AM TRANSMITTER ASSOCIATED WITH ARDV " << ADRV_id << endl;
}

void ADRVTransmitter::printObject()
{
	cout << "TRANSMITTER: " << ADRV_id << endl;
	cout << "BANDWIDTH: " << transmitterConfig.bw_hz << endl;
	cout << "SAMPLE FREQUENCY: " << transmitterConfig.fs_hz << endl;
	cout << "LO FREQUENCY: " << transmitterConfig.lo_hz << endl;
	cout << "RF PORT: " << transmitterConfig.rfport << endl;
}

void ADRVTransmitter::transmit(void* txBuf, uint32_t bufSize, uint32_t* TXPKT)
{
	uint32_t* packet = (uint32_t*)malloc(bufSize + HEADER_SIZE);
	uint32_t packetIndexCount = (bufSize + HEADER_SIZE) / sizeof(uint32_t);

	cout << "TRANSMITTING PACKET..." << endl;
	if (packet != NULL)
	{
		packet[0] = PACKET_START;
		packet[1] = bufSize;
		packet[2] = MESSAGE_START;
		std::memcpy(&packet[3], txBuf, bufSize);
		packet[packetIndexCount - 2] = MESSAGE_END;
		packet[packetIndexCount - 1] = PACKET_END;
	}

	cout << "PACKET TRANSMITTED!" << endl;

	if (packet != NULL)
	{
		std::memcpy(TXPKT, packet, bufSize + HEADER_SIZE);
	}
}
