
#include <iostream>
#include <string>
#include <cstring>
#include <iomanip>
#include "ADRV.h"

using std::cout;
using std::endl;

const uint32_t HEADER_SIZE =  20;
const uint32_t PACKET_START = 0x01535041;
const uint32_t MESSAGE_START = 0x02434548;
const uint32_t MESSAGE_END = 0x03415543;
const uint32_t PACKET_END = 0x04554D4C;

ADRV::ADRV()
{
  ADRV_id = 1;
}

ADRV::~ADRV()
{

}

void ADRV::printID()
{
  cout << "ID OF ADRV: " << ADRV_id << endl;
}

void ADRV::printObject()
{
  cout << "ADRV OBJECT" << endl;
}

//******************************************************************************
//******************************************************************************

ADRV_transmitter::ADRV_transmitter()
{
  transmitterConfig.bw_hz = 0;
  transmitterConfig.fs_hz = 0;
  transmitterConfig.lo_hz = 0;
  transmitterConfig.rfport = "NO SELECTION";
}

ADRV_transmitter::ADRV_transmitter(long long bandwidth, long long sampleFreq,
                                    long long loFreq, const char* radioPort)
{
  transmitterConfig.bw_hz = bandwidth;
  transmitterConfig.fs_hz = sampleFreq;
  transmitterConfig.lo_hz = loFreq;
  transmitterConfig.rfport = radioPort;
}

ADRV_transmitter::~ADRV_transmitter()
{

}

void ADRV_transmitter::printID()
{
  cout << "I AM TRANSMITTER ASSOCIATED WITH ARDV " << ADRV_id << endl;
}

void ADRV_transmitter::printObject()
{
  cout << "TRANSMITTER: " << ADRV_id << endl;
  cout << "BANDWIDTH: " << transmitterConfig.bw_hz << endl;
  cout << "SAMPLE FREQUENCY: " << transmitterConfig.fs_hz << endl;
  cout << "LO FREQUENCY: " << transmitterConfig.lo_hz << endl;
  cout << "RF PORT: " << transmitterConfig.rfport << endl;
}

void ADRV_transmitter::transmit(void* txBuf, uint32_t bufSize, uint32_t* TXPKT)
{
  uint32_t* packet = (uint32_t*)malloc(bufSize + HEADER_SIZE);
  uint32_t packetIndexCount = (bufSize + HEADER_SIZE) / sizeof(uint32_t);

  packet[0] = PACKET_START;
  packet[1] = bufSize;
  packet[2] = MESSAGE_START;
  std::memcpy(&packet[3], txBuf, bufSize);
  packet[packetIndexCount - 2] = MESSAGE_END;
  packet[packetIndexCount - 1] = PACKET_END;

  cout << "TRANSMITTING PACKET..." << endl;
  cout << "PACKET TRANSMITTED!" << endl;
  TXPKT = packet;
}

//******************************************************************************
//******************************************************************************

ADRV_receiver::ADRV_receiver()
{
  receiverConfig.bw_hz = 0;
  receiverConfig.fs_hz = 0;
  receiverConfig.lo_hz = 0;
  receiverConfig.rfport = "NO SELECTION";
}

ADRV_receiver::ADRV_receiver(long long bandwidth, long long sampleFreq,
                                    long long loFreq, const char* radioPort)
{
  receiverConfig.bw_hz = bandwidth;
  receiverConfig.fs_hz = sampleFreq;
  receiverConfig.lo_hz = loFreq;
  receiverConfig.rfport = radioPort;
}

ADRV_receiver::~ADRV_receiver()
{

}

void ADRV_receiver::printID()
{
  cout << "I AM RECEIVER ASSOCIATED WITH ARDV " << ADRV_id << endl;
}

void ADRV_receiver::printObject()
{
  cout << "RECEIVER: " << ADRV_id << endl;
  cout << "BANDWIDTH: " << receiverConfig.bw_hz << endl;
  cout << "SAMPLE FREQUENCY: " << receiverConfig.fs_hz << endl;
  cout << "LO FREQUENCY: " << receiverConfig.lo_hz << endl;
  cout << "RF PORT: " << receiverConfig.rfport << endl;
}

void ADRV_receiver::receive(void* rxBuf, uint32_t *RXPKT)
{
  uint32_t header;
  uint32_t dataSize;
  uint8_t currentByte;
  uint32_t* payload;

  std::memcpy(&header, rxBuf, 4);

  if (header == PACKET_START)
  {
    std::memcpy(&dataSize, &((uint32_t*)rxBuf)[4], 4);
    if (dataSize > 0)
    {
      payload = (uint32_t*)malloc(dataSize);
      std::memcpy(&header, rxBuf + 8, 4);
      if (header == MESSAGE_START)
      {
        std::memcpy(&payload, rxBuf + 12, dataSize);
        std::memcpy(&header, rxBuf + dataSize, 4);
        if (header == MESSAGE_END)
        {
          std::memcpy(&header, rxBuf + dataSize + 4, 4);
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

RXPKT = payload;
}
