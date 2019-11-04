
#include <iostream>
#include "ADRVReceiver.h"

using std::cout;
using std::endl;

ADRVReceiver::ADRVReceiver()
{
	receiverConfig.bw_hz = 0;
	receiverConfig.fs_hz = 0;
	receiverConfig.lo_hz = 0;
	receiverConfig.rfport = "NO SELECTION";
}

ADRVReceiver::ADRVReceiver(long long bandwidth, long long sampleFreq,
	long long loFreq, const char* radioPort)
{
	receiverConfig.bw_hz = bandwidth;
	receiverConfig.fs_hz = sampleFreq;
	receiverConfig.lo_hz = loFreq;
	receiverConfig.rfport = radioPort;
}

ADRVReceiver::ADRVReceiver(struct stream_cfg* rxCfg)
{
	receiverConfig = *rxCfg;
}

ADRVReceiver::~ADRVReceiver()
{

}

void ADRVReceiver::printID()
{
	cout << "I AM RECEIVER ASSOCIATED WITH ARDV " << ADRV_id << endl;
}

void ADRVReceiver::printObject()
{
	cout << "RECEIVER: " << ADRV_id << endl;
	cout << "BANDWIDTH: " << receiverConfig.bw_hz << endl;
	cout << "SAMPLE FREQUENCY: " << receiverConfig.fs_hz << endl;
	cout << "LO FREQUENCY: " << receiverConfig.lo_hz << endl;
	cout << "RF PORT: " << receiverConfig.rfport << endl;
}

bool ADRVReceiver::configureReceiver()
{

}


enum PARSE_STATE {NO_PKT = 0, PKT_START, MSG_START, MSG, MSG_END, PKT_END};

void ADRVReceiver::receive(void* rxBuf, uint32_t* RXPKT, uint32_t &bufSize)
{
	uint32_t header = 0;
	uint32_t dataSize = 0;
	uint32_t dataSizeBytes = 0;
	uint8_t dataSizeCount = 0;
	uint8_t dataSizeOffset = 0;
	uint8_t currentByte = 0;
	uint8_t byteCount = 0;
	uint8_t headerOffset = 0;
	uint32_t* payload = NULL;
	uint32_t wordCount = 0;
	int wordOffset = 0;
	bool validPacket = false;
	PARSE_STATE state = NO_PKT;

	cout << "RECEIVING PACKET..." << endl;
	while (!validPacket)
	{
		currentByte = ((uint8_t*)rxBuf)[byteCount];

		switch (state)
		{
			case NO_PKT:
			{
				header |= (currentByte << headerOffset);
				headerOffset += 8;
				if (header == PACKET_START)
				{
					cout << "FOUND PACKET START" << endl;
					headerOffset = 0;
					header = 0;
					state = PKT_START;
				}
				if (headerOffset > 24)
				{
					headerOffset = 0;
				}
				break;
			}
			case PKT_START:
			{
				if (dataSizeCount < 4)
				{
					dataSize |= (currentByte << dataSizeOffset);
					dataSizeCount++;
					dataSizeOffset += 8;
				}
				else if (dataSizeCount == 4)
				{
					header |= (currentByte << headerOffset);
					headerOffset += 8;
					if (header == MESSAGE_START)
					{
						cout << "FOUND MESSAGE START" << endl;
						header = 0;
						headerOffset = 0;
						dataSizeBytes = dataSize * sizeof(uint32_t);
						payload = (uint32_t*)malloc(dataSizeBytes);
						for (int i = 0; i < dataSize; i++)
						{
							payload[i] = 0;
						}
						state = MSG_START;

					}
					if (headerOffset > 24)
					{
						headerOffset = 0;
					}
				}
				break;
			}
			case MSG_START:
			{
				payload[wordCount] |= (currentByte << wordOffset);
				wordOffset += 8;

				if (payload[wordCount] == MESSAGE_END)
				{
					cout << "FOUND MESSAGE END" << endl;
					header = 0;
					headerOffset = 0;
					state = MSG_END;
				}
				if (wordOffset > 24)
				{
					wordCount++;
					wordOffset = 0;
				}
				break;
			}

			case MSG_END:
			{
				header |= (currentByte << headerOffset);
				headerOffset += 8;
				if (header == PACKET_END)
				{
					cout << "FOUND PACKET END" << endl;
					headerOffset = 0;
					header = 0;
					state = PKT_END;
				}
				if (headerOffset > 24)
				{
					headerOffset = 0;
				}
				break;
			}

			case PKT_END:
			{
				cout << "PACKET RECEIVED!" << endl;
				validPacket = true;
				bufSize = dataSize;

				if (payload != NULL)
				{
					std::memcpy(RXPKT, payload, dataSizeBytes);
				}
				break;
			}
		}
		byteCount++;
	}

	/*
	while (!validPacket)
	{


		header |= currentByte;
		if (header == PACKET_START)
		{
			cout << "FOUND HEADER!" << endl;
			validPacket = true;
		}
		else
		{
			header <<= 8;
		}
		byteCount++;
	} */

	/*
	for (int i = 0; i < 20; i++)
	{
		cout << std::hex << ((uint32_t*)rxBuf)[i] << endl;
	}

	std::memcpy(&header, (uint32_t*)rxBuf, 4);
	cout << "HEADER: " << header << endl;
	system("PAUSE");
	if (header == PACKET_START)
	{
		std::memcpy(&dataSize, (rxBuf + 4), 4);
		cout << "DATA SIZE: " << dataSize << endl;
		if (dataSize > 0)
		{
			payload = (uint32_t*)malloc(dataSize);
			std::memcpy(&header, &((uint32_t*)rxBuf)[8], 4);
			if (header == MESSAGE_START)
			{
				std::memcpy(&payload, &((uint32_t*)rxBuf)[12], dataSize);
				std::memcpy(&header, &((uint32_t*)rxBuf)[dataSize], 4);
				if (header == MESSAGE_END)
				{
					std::memcpy(&header, &((uint32_t*)rxBuf)[dataSize + 4], 4);
					if (header == PACKET_END)
					{
						cout << "PACKET SUCCESSFULLY RECEIVED - PAYLOAD: " << endl;
						for (int i = 0; i < (dataSize / sizeof(uint32_t)); i++)
						{
							cout << "PAYLOAD BYTE i = " << i << ": " << payload[i] << endl;
						}
					}
				}
			}
		}
	}

	if (payload != NULL)
	{
		RXPKT = payload;
	} */
}
