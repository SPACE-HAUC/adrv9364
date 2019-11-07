
#include <iostream>
#include "ADRV.h"

using std::cout;
using std::endl;

ADRV::ADRV()
{
  ADRV_id = 1;
  cout << "I AM IN DEFAULT" << endl;
  ctx = iio_create_default_context();
  physDev = iio_context_find_device(ctx, AD9361PHYS.c_str());
  contextDeviceCount = iio_context_get_devices_count(ctx);

  txConfig.bw_hz = 0;
  txConfig.fs_hz = 0;
  txConfig.lo_hz = 0;
  txConfig.rfport = "NO SELECTION";

  rxConfig.bw_hz = 0;
  rxConfig.fs_hz = 0;
  rxConfig.lo_hz = 0;
  rxConfig.rfport = "NO SELECTION";

  struct iio_device* tx = NULL;
  struct iio_channel* tx0_q = NULL;
  struct iio_channel* tx0_i = NULL;
  struct iio_channel* tx_phys = NULL;
  struct iio_channel* tx_lo = NULL;
  struct iio_buffer* txBuf = NULL;

  struct iio_device* rx = NULL;
  struct iio_channel* rx0_q = NULL;
  struct iio_channel* rx0_i = NULL;
  struct iio_channel* rx_phys = NULL;
  struct iio_channel* rx_lo = NULL;
  struct iio_buffer* rxBuf = NULL;
}

ADRV::ADRV(gigaInt tx_bw_hz, gigaInt tx_fs_hz, gigaInt tx_lo_hz,
    gigaInt rx_bw_hz, gigaInt rx_fs_hz, gigaInt rx_lo_hz,
    const char* tx_portName, const char* rx_portName)
{
  ADRV_id = 2;
  ctx = iio_create_default_context();
  contextDeviceCount = iio_context_get_devices_count(ctx);
  physDev = iio_context_find_device(ctx, AD9361PHYS.c_str());

  txConfig.bw_hz = tx_bw_hz;
  txConfig.fs_hz = tx_fs_hz;
  txConfig.lo_hz = tx_lo_hz;
  txConfig.rfport = tx_portName;

  rxConfig.bw_hz = rx_bw_hz;
  rxConfig.fs_hz = rx_fs_hz;
  rxConfig.lo_hz = rx_lo_hz;
  rxConfig.rfport = rx_portName;

  struct iio_device* tx = NULL;
  struct iio_channel* tx0_q = NULL;
  struct iio_channel* tx0_i = NULL;
  struct iio_channel* tx_phys = NULL;
  struct iio_channel* tx_lo = NULL;
  struct iio_buffer* txBuf = NULL;

  struct iio_device* rx = NULL;
  struct iio_channel* rx0_q = NULL;
  struct iio_channel* rx0_i = NULL;
  struct iio_channel* rx_phys = NULL;
  struct iio_channel* rx_lo = NULL;
  struct iio_buffer* rxBuf = NULL;
}
    // Parameterized Constructor by structure
ADRV::ADRV(struct stream_cfg& txCfg, struct stream_cfg& rxCfg)
{
  ADRV_id = 3;
  ctx = iio_create_default_context();
  contextDeviceCount = iio_context_get_devices_count(ctx);
  physDev = iio_context_find_device(ctx, AD9361PHYS.c_str());

  txConfig = txCfg;
  rxConfig = rxCfg;

  struct iio_device* tx = NULL;
  struct iio_channel* tx0_q = NULL;
  struct iio_channel* tx0_i = NULL;
  struct iio_channel* tx_phys = NULL;
  struct iio_channel* tx_lo = NULL;
  struct iio_buffer* txBuf = NULL;

  struct iio_device* rx = NULL;
  struct iio_channel* rx0_q = NULL;
  struct iio_channel* rx0_i = NULL;
  struct iio_channel* rx_phys = NULL;
  struct iio_channel* rx_lo = NULL;
  struct iio_buffer* rxBuf = NULL;
}

ADRV::~ADRV()
{
  cout << "ADRV DEST CONST CALL" << endl;
}

void ADRV::printID()
{
  cout << "ID OF ADRV: " << ADRV_id << endl;
}

void ADRV::printObject()
{
  cout << "ADRV OBJECT" << endl;
}

void ADRV::contextHK()
{
  cout << "********** CONTEXT HOUSE KEEPING **********" << endl;
  const char* name = iio_context_get_name(ctx);
  const char* description = iio_context_get_description(ctx);
  uint32_t attributeCount = iio_context_get_attrs_count(ctx);
  uint32_t devCount = iio_context_get_devices_count(ctx);
  cout << "Context name: " << name << endl;
  cout << "Context description: " << description << endl;
  cout << "Device count: " << devCount << endl;
  cout << "Attribute count: " << attributeCount << endl;

  const char** attrName, attrVal;
  for (int i = 0; i < attributeCount; i++)
  {
    int ret = iio_context_get_attr(ctx, i, attrName, attrVal);
    cout << "Attribute Name: " << attrName << " Attribute Value: " << attrVal << endl;
  }

  return;
}

void ADRV::deviceHK()
{

}

void ADRV::channelHK()
{

}

void ADRV::initializeTransmitter()
{
  // Create the transmitter device
  tx = iio_context_find_device(ctx, TXDEVICE.c_str());

  // Create the i and q channels
  if (tx != NULL)
  {
    tx0_i = iio_device_find_channel(tx, "voltage0", TXMODE);
    if (tx0_i == NULL)
    {
      cout << "COULD NOT FIND TX VOLTAGE0, USING ALTVOLTAGE" << endl;
      tx0_i = iio_device_find_channel(tx, "altvoltage0", TXMODE);
      if (tx0_i == NULL)
      {
        cout << "ERROR COULD NOT CREATE TX0_I CHANNEL" << endl;
      }
    }
    tx0_q = iio_device_find_channel(tx, "voltage1", TXMODE);
    if (tx0_q == NULL)
    {
      cout << "COULD NOT FIND TX VOLTAGE1, USING ALTVOLTAGE" << endl;
      tx0_q = iio_device_find_channel(tx, "altvoltage1", TXMODE);
      if (tx0_q == NULL)
      {
        cout << "ERROR COULD NOT CREATE TX0_Q CHANNEL" << endl;
      }
    }

    txBuf = iio_device_create_buffer(tx, 1024 * 1024, false);

    if (txBuf == NULL)
    {
      cout << "ERROR COULD NOT CREATE TX BUFFER" << endl;
    }
  }

  // Create the transmitter physical channel
  tx_phys = iio_device_find_channel(physDev, "voltage0", true);
  if (tx_phys != NULL)
  {
    iio_channel_attr_write_longlong(tx_phys, ATTR_BW.c_str(), txConfig.bw_hz);
    iio_channel_attr_write_longlong(tx_phys, ATTR_FS.c_str(), txConfig.fs_hz);
    iio_channel_attr_write(tx_phys, ATTR_PORT.c_str(), txConfig.rfport);
  }
  else
  {
    cout << "ERROR WITH INITIALIZING PHYSICAL TRANSMITTER CHANNEL" << endl;
  }

  // Create the transmitter local oscillator
  tx_lo = iio_device_find_channel(physDev, "altvoltage1", true);
  if (tx_lo != NULL)
  {
    iio_channel_attr_write_longlong(tx_lo, ATTR_F.c_str(), txConfig.lo_hz);
  }
  else
  {
    cout << "ERROR WITH INITIALIZING TRANSMITTER LOCAL OSCILLATOR" << endl;
  }

  if (tx0_i != NULL && tx0_q != NULL)
  {
    iio_channel_enable(tx0_i);
    iio_channel_enable(tx0_q);
  }
}

void ADRV::initializeReceiver()
{
  // Create the receiver device
  rx = iio_context_find_device(ctx, RXDEVICE.c_str());

  if (rx != NULL)
  {
    rx0_i = iio_device_find_channel(rx, "voltage0", RXMODE);
    if (rx0_i == NULL)
    {
      cout << "COULD NOT FIND RX VOLTAGE0, USING ALTVOLTAGE" << endl;
      rx0_i = iio_device_find_channel(rx, "altvoltage0", RXMODE);
      if (rx0_i == NULL)
      {
        cout << "ERROR COULD NOT CREATE RX0_I CHANNEL" << endl;
      }
    }
    rx0_q = iio_device_find_channel(rx, "voltage1", RXMODE);
    if (rx0_q == NULL)
    {
      cout << "COULD NOT FIND RX VOLTAGE1, USING ALTVOLTAGE" << endl;
      rx0_q = iio_device_find_channel(rx, "altvoltage1", RXMODE);
      if (rx0_q == NULL)
      {
        cout << "ERROR COULD NOT CREATE RX0_Q CHANNEL" << endl;
      }
    }

    rxBuf = iio_device_create_buffer(rx, 1024 * 1024, NONCYCLIC);

    if (rxBuf == NULL)
    {
      cout << "ERROR COULD NOT CREATE RX BUFFER" << endl;
    }
  }

  // Create the receiver physical channel
  rx_phys = iio_device_find_channel(physDev, "voltage0", false);
  if (rx_phys != NULL)
  {
    iio_channel_attr_write_longlong(rx_phys, ATTR_BW.c_str(), rxConfig.bw_hz);
    iio_channel_attr_write_longlong(rx_phys, ATTR_FS.c_str(), rxConfig.fs_hz);
    iio_channel_attr_write(rx_phys, ATTR_PORT.c_str(), rxConfig.rfport);
  }
  else
  {
    cout << "ERROR WITH INITIALIZING PHYSICAL RECEIVER CHANNEL" << endl;
  }

  // Create the receiver local oscillator
  rx_lo = iio_device_find_channel(physDev, "altvoltage0", true);
  if (rx_lo != NULL)
  {
    iio_channel_attr_write_longlong(rx_lo, ATTR_F.c_str(), rxConfig.lo_hz);
  }
  else
  {
    cout << "ERROR WITH INITIALIZING TRANSMITTER LOCAL OSCILLATOR" << endl;
  }

  if (rx0_i != NULL && rx0_q != NULL)
  {
    iio_channel_enable(rx0_i);
    iio_channel_enable(rx0_q);
  }
}
