
#include <iostream>
#include <string>
#include "ADRVReceiver.h"
#include "ADRVTransmitter.h"

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
	ADRVTransmitter t1;
	ADRVTransmitter t2(50, 50, 50, "PORT A");
	ADRVReceiver r1;
	ADRVReceiver r2(50, 50, 50, "PORT B");

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

	stringToUINT32(helloWorld, helloWorldUI, msgLengthElements, msgLengthBytes);
	for (int i = 0; i < msgLengthElements; i++)
	{
		cout << (char)helloWorldUI[i] << endl;
	}
	cout << "NUM ELEMENTS: " << msgLengthElements << endl;
	cout << "NUM BYTES: " << msgLengthBytes << endl;


	/*for (int i = 0; i < 100; i++)
	{
		sampleData[i] = i;
		//cout << "INDEX i = " << i << ": " << sampleData[i] << endl;
	}*/

	t2.transmit((void*)helloWorldUI, msgLengthBytes, TXBUF);
	/*for (int i = 0; i < 50; i++)
	{
		cout << std::hex << TXBUF[i] << endl;
	}*/
	r2.receive((void*)TXBUF, RXBUF, rxBufLength);

	cout << rxBufLength << endl;
	for (int i = 0; i < rxBufLength; i++)
	{
		cout << (char)RXBUF[i] << endl;
	}

	/*for (int i = 0; i < 50; i++)
	{
		cout << (char)RXBUF[i] << endl;
	}*/

	return 0;

}
