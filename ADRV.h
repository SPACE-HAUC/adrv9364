
#ifndef ADRV_H
#define ADRV_H

#include <string>
#include <cstring>
#include <iomanip>
#include <stdint.h>
#include <stdlib.h>
#include <iio.h>

const uint32_t HEADER_SIZE =  20;
const uint32_t PACKET_START = 0x01535041;
const uint32_t MESSAGE_START = 0x02434548;
const uint32_t MESSAGE_END = 0x03415543;
const uint32_t PACKET_END = 0x04554D4C;

std::string RXDEVICE = "cf-ad9361-lpc";
std::string TXDEVICE = "cf-ad9361-dds-core-lpc";

struct stream_cfg
{
  long long bw_hz;
  long long fs_hz;
  long long lo_hz;
  const char* rfport;
};

class ADRV
{
public:
  ADRV();
  ~ADRV();
  void contextHK();
  virtual void printID();
  virtual void printObject();
protected:
  int ADRV_id;
  int contextDeviceCount;
private:
  struct iio_context* myContext;
};

#endif
