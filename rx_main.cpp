
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
	struct stream_cfg rxConfiguration;
	rxConfiguration.bw_hz = MHZ(2);
	rxConfiguration.fs_hz = MHZ(2.5);
	rxConfiguration.lo_hz = GHZ(2.5);
	rxConfiguration.rfport = "A_BALANCED";

	initADRV();

    bool rxFlag = initRX(&rxConfiguration);

    if (rxFlag)
        cout << "INIT RX COMPLETE" << endl;

    while ( 1 )
    {
        int bytesReceived = 0;
        do
        {
            cout << "TRYING..." << endl;
            bytesReceived = receive();
            cout << "CRYING..." << endl;
            sleep(1);
        } while ( bytesReceived < 0 ) ;

        uint32_t numBytesReceived = 0;
        uint32_t packet[50];
        cout << "I RECEIVED " << bytesReceived << " BYTES" << endl;

        bool packetFlag = readBufferToPacket(packet, &numBytesReceived);
        for (int i = 0; i < numBytesReceived; i++)
        {
            for ( int j = 0 ; j < 4 ; j++ )
            {
                printf("%c ",(char)(packet[i]>>8*j)) ;
            }
        }
        cout << endl ;
        sleep(0.25);
    }
	return 0;
}

