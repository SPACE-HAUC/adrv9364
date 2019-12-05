
#ifndef ADRV_H
#define ADRV_H

#include <string>
#include <cstring>
#include <iomanip>
#include <stdint.h>
#include <stdlib.h>
#include <iio.h>
#include <stdio.h>

const uint32_t HEADER_SIZE =  20;
const uint32_t PACKET_START = 0x01535041;
const uint32_t MESSAGE_START = 0x02434548;
const uint32_t MESSAGE_END = 0x03415543;
const uint32_t PACKET_END = 0x04554D4C;

const uint32_t MAX_BUFFER_SIZE = 1024 * 1024;

const std::string RXDEVICE = "cf-ad9361-lpc";
const std::string TXDEVICE = "cf-ad9361-dds-core-lpc";
const std::string AD9361PHYS = "ad9361-phy";

const std::string ATTR_BW = "rf_bandwidth";
const std::string ATTR_FS = "sampling_frequency";
const std::string ATTR_PORT = "rf_port_select";
const std::string ATTR_F = "frequency";

enum mode { RXMODE = 0, TXMODE = 1};
enum cyclicMode { NONCYCLIC = 0, CYCLIC = 1 };
enum errorCode 
{ 
  NO_ERROR = 0, DEV_ERROR, 
  CHN_ERROR, PHYS_ERROR, 
  LO_ERROR, BUF_ERROR
};
typedef unsigned long long int gigaInt;

struct stream_cfg
{
  gigaInt bw_hz;
  gigaInt fs_hz;
  gigaInt lo_hz;
  const char* rfport;
};

class ADRV
{
public:
  // Default Constructor
  ADRV();
  // Parameterized Constructor by field
  ADRV(gigaInt tx_bw_hz, gigaInt tx_fs_hz, gigaInt tx_lo_hz,
      gigaInt rx_bw_hz, gigaInt rx_fs_hz, gigaInt rx_lo_hz,
      const char* tx_port, const char* rx_portName);
      // Parameterized Constructor by structure
  ADRV(struct stream_cfg& txCfg, struct stream_cfg& rxCfg);
  // Default Destructor
  ~ADRV();

  // Debug the ADRV context
  void contextHK();
  // Debug the ADRV's device
  void deviceHK();
  // Debug the ADRV's channel
  void channelHK();
  // Initialize the receiver module
  void initializeTransmitter();

  void writePacketToBuffer(uint8_t* packet, uint32_t numBytes);
  void readBufferToPacket(uint8_t* packet, uint32_t &numBytes);

  // Initialize the transmitter module
  void initializeReceiver();

  // Transmit bufSize bytes from txBuf array - TXPKT used for testing purposes
  //bool transmit(void* txBuf, uint32_t* TXPKT, uint32_t &bufSize);
  void transmit();
  // Receive array rxBuf from the HW, extract the data and write bufSize bytes to RXPKT
  bool receive();

  void printID();
  void printObject();
  void processError(errorCode error, bool debug);
  bool debugFlag = true;
private:

  /* ********** IIO CONSTRUCTS **********/

  // Context and internal states
  struct iio_context* ctx;
  struct iio_device* physDev;
  int ADRV_id;
  int contextDeviceCount;

  // Transmitter Module
  struct iio_device* tx;
  struct iio_channel* tx0_q;
  struct iio_channel* tx0_i;
  struct iio_channel* tx_phys;
  struct iio_channel* tx_lo;
  struct iio_buffer* txBuf;
  struct stream_cfg txConfig;

  // Receiver Module
  struct iio_device* rx;
  struct iio_channel* rx0_q;
  struct iio_channel* rx0_i;
  struct iio_channel* rx_phys;
  struct iio_channel* rx_lo;
  struct iio_buffer* rxBuf;
  struct stream_cfg rxConfig;
};

bool createPacket(const char* strMsg, uint32_t numBytes, uint8_t** packet, uint32_t &numBytesRet);

#endif
