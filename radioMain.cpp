
#include <iostream>
#include <string>
#include "ADRV.h"
//#include "ADRVReceiver.h"
//#include "ADRVTransmitter.h"

using std::cout;
using std::endl;
using std::string;

#define MHZ(x) ((long long)(x*1000000.0 + .5))
#define GHZ(x) ((long long)(x*1000000000.0 + .5))

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
	txConfiguration.bw_hz = MHZ(1.5);
	txConfiguration.fs_hz = MHZ(2.5);
	txConfiguration.lo_hz = GHZ(2.5);
	txConfiguration.rfport = "A";

	string testMessage = "Hello World!";

	initADRV();

	uint32_t* packet;
	uint32_t packetSize = 0;
	bool txFlag = initTX(&txConfiguration);
	if (txFlag) 
		cout << "INIT TX COMPLETE" << endl;
	bool packetFlag = createPacket(testMessage.c_str(), testMessage.length(), &packet, packetSize)
	
	if (packetFlag)
		cout << "PACKET FLAG COMPLETE" << endl;

	for (int i = 0; i < packetSize; i++)
  	{
    	printf("MAIN BYTE AT %d = %02X\n", i, packet[i]);
 	}
	
	bool writeFlag = writePacketToBuffer(packet, packetSize);

	if (writeFlag)
		cout << "WRITE FLAG COMPLETE" << endl;

	bool transmitFlag = transmit();

	if (transmitFlag)
		cout << "TRANSMIT COMPLETE" << endl;

	return 0;
}


/*
int main()
{
	struct stream_cfg txConfiguration;
	struct stream_cfg rxConfiguration;

	string testMessage = "Hello World!";

	txConfiguration.bw_hz = MHZ(1.5);
	txConfiguration.fs_hz = MHZ(2.5);
	txConfiguration.lo_hz = GHZ(2.5);
	txConfiguration.rfport = "A";

	rxConfiguration.bw_hz = MHZ(2);
	rxConfiguration.fs_hz = MHZ(2.5);
	rxConfiguration.lo_hz = GHZ(2.5);
	rxConfiguration.rfport = "A_BALANCED";

	ADRV satTransceiver(txConfiguration, rxConfiguration);
	satTransceiver.printID();

	uint8_t* packet;
	uint8_t* packet2;// = (uint8_t*)malloc(20 * sizeof(uint8_t));
	//packet2 = (uint8_t*)malloc(32 * sizeof(uint8_t));

	uint32_t packetSize = 0;
	uint32_t packetSize2 = 0;
	bool packetFlag = createPacket(testMessage.c_str(), testMessage.length(), &packet, packetSize);
	 for (int i = 0; i < packetSize; i++)
  	{
    	printf("MAIN BYTE AT %d = %02X\n", i, packet[i]);
 	}

	satTransceiver.initializeTransmitter();
	//satTransceiver.initializeReceiver();

	cout << "TX RX ONLINE" << endl;

	satTransceiver.writePacketToBuffer(packet, packetSize);
	satTransceiver.transmit();

	/*packet2 = (uint8_t*)malloc(packetSize * sizeof(uint8_t));
	satTransceiver.readBufferToPacket(packet2, packetSize2);

	cout << "DATA MOVED TO BUFFER, DATA READ FROM BUFFER!" << endl;
	cout << "BYTES READ: " << packetSize2 << endl;
	for (int i = 0; i < packetSize2; i++)
  	{
    	printf("BYTE AT %d = %02X\n", i, packet2[i]);
  	}*/
	

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
	} 
	return 0;

} */
