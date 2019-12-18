
#include <iostream>
#include <string>
#include <unistd.h>
#include "ADRV.h"

using std::cout;
using std::endl;
using std::string;

#define MHZ(x) ((long long)(x*1000000.0 + .5))
#define GHZ(x) ((long long)(x*1000000000.0 + .5))

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
	bool packetFlag = createPacket(testMessage.c_str(), testMessage.length(), &packet, &packetSize);
	
	if (packetFlag)
		cout << "PACKET FLAG COMPLETE" << endl;

	for (int i = 0; i < packetSize; i++)
  	{
    	printf("MAIN BYTE AT %d = %02X\n", i, packet[i]);
 	}
	while(1){
		bool writeFlag = writePacketToBuffer(packet, packetSize);

		if (writeFlag)
			cout << "WRITE FLAG COMPLETE" << endl;

		bool transmitFlag = transmit();

		if (transmitFlag)
			cout << "TRANSMIT COMPLETE" << endl;
		sleep(1);
	}

	return 0;
}

