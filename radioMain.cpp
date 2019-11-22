
#include <iostream>
#include <string>
#include "ADRV.h"
//#include "ADRVReceiver.h"
//#include "ADRVTransmitter.h"

using std::cout;
using std::endl;
using std::string;

void stringToUINT32(string baseString, uint32_t *& convertedMessage, uint32_t &arraySize, uint32_t &messageSizeBytes)
{
	for (int i = 0; i < baseString.length(); i++)
	{
		convertedMessage[i] = baseString[i];
	}
	arraySize = baseString.length();
	messageSizeBytes = arraySize * 4;
}

int main()
{
	struct stream_cfg txConfiguration;
	struct stream_cfg rxConfiguration;

	string testMessage = "Hello World!";

	txConfiguration.bw_hz = 10;
	txConfiguration.fs_hz = 20;
	txConfiguration.lo_hz = 10;
	txConfiguration.rfport = "A";

	rxConfiguration.bw_hz = 10;
	rxConfiguration.fs_hz = 20;
	rxConfiguration.lo_hz = 10;
	rxConfiguration.rfport = "A";

	ADRV satTransceiver(txConfiguration, rxConfiguration);
	satTransceiver.printID();

	uint8_t* packet;
	bool packetFlag = createPacket(testMessage.c_str(), testMessage.length(), packet);
	//satTransceiver.initializeTransmitter();
	//satTransceiver.initializeReceiver();

	cout << "TX RX ONLINE" << endl;
	//txBuffer = iio_device_create_buffer(satTransceiver.getTransmitter(), 1024 * 1024, false);

	/*if (txBuffer == NULL)
	{
		cout << "ERROR CREATING BUFFER HERE!" << endl;
	}*/



	//satCPU.contextHK();
	//ADRVTransmitter t1;
	//t1.contextHK();
	//ADRVTransmitter t2(50, 50, 50, "PORT A");
//	ADRVReceiver r1;
	//r1.contextHK();
	//ADRVReceiver r2(50, 50, 50, "PORT B");

/*
	uint32_t TXBUF[1000];
	uint32_t RXBUF[1000];

	cout << "********** STATUS MESSAGES **********" << endl;
	//t1.printObject();
	//t2.printObject();
	//r1.printObject();
	//r2.printObject();
	cout << "********** STATUS MESSAGES **********" << endl;

	uint32_t sampleData[100];
	string helloWorld = "HELLO WORLD!";
	uint32_t* helloWorldUI = (uint32_t*)malloc(helloWorld.length() * sizeof(uint32_t));
	uint32_t msgLengthElements;
	uint32_t msgLengthBytes;
	uint32_t rxBufLength = 0;
*/
	/*
	stringToUINT32(helloWorld, helloWorldUI, msgLengthElements, msgLengthBytes);
	for (int i = 0; i < msgLengthElements; i++)
	{
		cout << (char)helloWorldUI[i] << endl;
	}
	cout << "NUM ELEMENTS: " << msgLengthElements << endl;
	cout << "NUM BYTES: " << msgLengthBytes << endl;




	t2.transmit((void*)helloWorldUI, msgLengthBytes, TXBUF);
	r2.receive((void*)TXBUF, RXBUF, rxBufLength);

	cout << rxBufLength << endl;
	for (int i = 0; i < rxBufLength; i++)
	{
		cout << (char)RXBUF[i] << endl;
	} */
	return 0;

}
