
#include <iostream>
#include <string>
#include "ADRV.h"

using std::cout;
using std::endl;
using std::string;

#define MHZ(x) ((long long)(x*1000000.0 + .5))
#define GHZ(x) ((long long)(x*1000000000.0 + .5))

int main()
{
	struct stream_cfg rxConfiguration;
	rxConfiguration.bw_hz = MHZ(2);
	rxConfiguration.fs_hz = MHZ(2.5);
	rxConfiguration.lo_hz = GHZ(2.5);
	rxConfiguration.rfport = "A_BALANCED";

	initADRV();

    bool rxFlag = initRX(&rxConfiguration);

    if (rxFlag)
        cout << "INIT RX COMPLETE" << endl;

    bool receiveFlag = receive();

    size_t bytesReceived = 0;
    do
    {
        bytesReceived = receive();
    } while (bytesReceived == 0);

    uint32_t numBytesReceived = 0;
    uint32_t packet[50];


    bool packetFlag = readBufferToPacket(packet, &numBytesReceived);
    for (int i = 0; i < numBytesReceived; i++)
  	{
    	printf("MAIN BYTE AT %d = %02X\n", i, packet[i]);
 	}

	return 0;
}

