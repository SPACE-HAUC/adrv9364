
#ifndef ADRV_H
#define ADRV_H

#include <stdio.h>
#include <iostream>
#include <string>
#include <stdlib.h>
#include <iio.h>

using std::cout;
using std::endl;
/* CONSTANTS */

const uint32_t HEADER_SIZE =  20;
const uint32_t PACKET_START = 0x01535041;
const uint32_t MESSAGE_START = 0x02434548;
const uint32_t MESSAGE_END = 0x03415543;
const uint32_t PACKET_END = 0x04554D4C;

const uint32_t MAX_BUFFER_SIZE = 1048576; //1024 * 1024;

const std::string RXDEVICE = "cf-ad9361-lpc";
const std::string TXDEVICE = "cf-ad9361-dds-core-lpc";
const std::string AD9361PHYS = "ad9361-phy";

const std::string ATTR_BW = "rf_bandwidth";
const std::string ATTR_FS = "sampling_frequency";
const std::string ATTR_PORT = "rf_port_select";
const std::string ATTR_F = "frequency";

struct stream_cfg
{
  long long bw_hz;
  long long fs_hz;
  long long lo_hz;
  const char* rfport;
};

enum mode { RXMODE = 0, TXMODE = 1};
enum cyclicMode { NONCYCLIC = 0, CYCLIC = 1 };
enum errorCode 
{ 
  NO_ERROR = 0, DEV_ERROR, 
  CHN_ERROR, PHYS_ERROR, 
  LO_ERROR, BUF_ERROR
};

/* GLOBALS */

static struct iio_context* ctx = NULL;
static struct iio_device* physDev = NULL;

// Transmitter Module
static struct iio_device* tx = NULL;
static struct iio_channel* tx0_q = NULL;
static struct iio_channel* tx0_i = NULL;
static struct iio_channel* tx_phys = NULL;
static struct iio_channel* tx_lo = NULL;
static struct iio_buffer* txBuf = NULL;
static struct stream_cfg txConfig = NULL;

// Receiver Module
static struct iio_device* rx = NULL;
static struct iio_channel* rx0_q = NULL;
static struct iio_channel* rx0_i = NULL;
static struct iio_channel* rx_phys = NULL;
static struct iio_channel* rx_lo = NULL;
static struct iio_buffer* rxBuf = NULL;
static struct stream_cfg rxConfig = NULL;

void contextHK(static struct iio_context* m_context);
void deviceHK(static struct iio_device* m_device);
void channelHK(static struct iio_channel* m_channel);

bool initADRV();
bool initTX(static struct stream_cfg* transmitterConfig);
bool initRX(static struct stream_cfg* receiverConfig);

bool createPacket(const char* strMsg, uint32_t numBytes, uint32_t** packet, uint32_t* numBytesRet);
bool writePacketToBuffer(uint32_t* packet, uint32_t numBytes);
bool readBufferToPacket(uint32_t* packet, uint32_t* numBytesRet);

bool transmit();
bool receive();





#endif