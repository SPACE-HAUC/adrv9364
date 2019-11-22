
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

  tx = NULL;
  tx0_q = NULL;
  tx0_i = NULL;
  tx_phys = NULL;
  tx_lo = NULL;
  txBuf = NULL;

  rx = NULL;
  rx0_q = NULL;
  rx0_i = NULL;
  rx_phys = NULL;
  rx_lo = NULL;
  rxBuf = NULL;
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

  tx = NULL;
  tx0_q = NULL;
  tx0_i = NULL;
  tx_phys = NULL;
  tx_lo = NULL;
  txBuf = NULL;

  rx = NULL;
  rx0_q = NULL;
  rx0_i = NULL;
  rx_phys = NULL;
  rx_lo = NULL;
  rxBuf = NULL;
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

  tx = NULL;
  tx0_q = NULL;
  tx0_i = NULL;
  tx_phys = NULL;
  tx_lo = NULL;
  txBuf = NULL;

  rx = NULL;
  rx0_q = NULL;
  rx0_i = NULL;
  rx_phys = NULL;
  rx_lo = NULL;
  rxBuf = NULL;
}
//******************************************************************************
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

void ADRV::processError(errorCode error, bool debug)
{
  if (debug)
  {
    switch(error)
    {
      case NO_ERROR: break;
      case DEV_ERROR: 
        cout << "ERROR - DEVICE IN FAULT" << endl; 
        break;
      case CHN_ERROR:
        cout << "ERROR - CHANNEL IN FAULT" << endl;
        break;
      case PHYS_ERROR:
        cout << "ERROR - PHYSICAL DEVICE IN FAULT" << endl;
        break;
      case LO_ERROR:
        cout << "ERROR - LOCAL OSCILLATOR IN FAULT" << endl;
        break;
      case BUF_ERROR:
        cout << "ERROR - BUFFER IN FAULT" << endl;
        break;
      default:
        cout << "UNSPECIFIED ERROR" << endl;
    }
  }
  
}

void ADRV::initializeTransmitter()
{
  // Create the transmitter device
  tx = iio_context_find_device(ctx, TXDEVICE.c_str());
  
  // Proceed if transmitter created successfully
  if (tx != NULL)
  {
    cout << "***** Transmitter device initialized" << endl;
    tx0_i = iio_device_find_channel(tx, "voltage0", TXMODE);
   
    if (tx0_i == NULL)
    {
      cout << "COULD NOT FIND TX VOLTAGE0, USING ALTVOLTAGE" << endl;
      tx0_i = iio_device_find_channel(tx, "altvoltage0", TXMODE);
      if (tx0_i == NULL)
      {
        processError(CHN_ERROR, debugFlag);
      }
    }
    else
    {
       cout << "********** Transmitter device, i-channel initialized" << endl;
    }
    
    tx0_q = iio_device_find_channel(tx, "voltage1", TXMODE);
    
    if (tx0_q == NULL)
    {
      cout << "COULD NOT FIND TX VOLTAGE1, USING ALTVOLTAGE" << endl;
      tx0_q = iio_device_find_channel(tx, "altvoltage1", TXMODE);
      if (tx0_q == NULL)
      {
        processError(CHN_ERROR, debugFlag);
      }
    }
    else
    {
      cout << "********** Transmitter device, q-channel initialized" << endl;
    }
    
  }
  else
  {
    processError(DEV_ERROR, debugFlag);
  }
  
  // Create the transmitter physical channel
  tx_phys = iio_device_find_channel(physDev, "voltage0", true);
  
  if (tx_phys != NULL)
  {
    cout << "********** Transmitter device, phys-channel initialized" << endl;
    iio_channel_attr_write_longlong(tx_phys, ATTR_BW.c_str(), txConfig.bw_hz);
    iio_channel_attr_write_longlong(tx_phys, ATTR_FS.c_str(), txConfig.fs_hz);
    iio_channel_attr_write(tx_phys, ATTR_PORT.c_str(), txConfig.rfport);
  }
  else
  {
    processError(PHYS_ERROR, debugFlag);
  }

  // Create the transmitter local oscillator
  tx_lo = iio_device_find_channel(physDev, "altvoltage1", true);
  if (tx_lo != NULL)
  {
    cout << "********** Transmitter device, lo-channel initialized" << endl;
    iio_channel_attr_write_longlong(tx_lo, ATTR_F.c_str(), txConfig.lo_hz);
  }
  else
  {
    processError(LO_ERROR, debugFlag);
  }
 
  if (tx0_i != NULL && tx0_q != NULL)
  {
    iio_channel_enable(tx0_i);
    iio_channel_enable(tx0_q);
    cout << "********** Transmitter channels i and q enabled" << endl;
  }
  txBuf = iio_device_create_buffer(tx, MAX_BUFFER_SIZE, NONCYCLIC);
  if (txBuf == NULL)
  {
    processError(BUF_ERROR, debugFlag);
  }
  else
  {
    cout << "********** Transmitter buffer initialized" << endl;
  }
}

void ADRV::initializeReceiver()
{
  // Create the receiver device
  rx = iio_context_find_device(ctx, RXDEVICE.c_str());

  if (rx != NULL)
  {
    cout << "***** Receiver device initialized" << endl;
    rx0_i = iio_device_find_channel(rx, "voltage0", RXMODE);
    if (rx0_i == NULL)
    {
      cout << "COULD NOT FIND RX VOLTAGE0, USING ALTVOLTAGE" << endl;
      rx0_i = iio_device_find_channel(rx, "altvoltage0", RXMODE);
      if (rx0_i == NULL)
      {
        processError(CHN_ERROR, debugFlag);
      }
    }
    rx0_q = iio_device_find_channel(rx, "voltage1", RXMODE);
    if (rx0_q == NULL)
    {
      cout << "COULD NOT FIND RX VOLTAGE1, USING ALTVOLTAGE" << endl;
      rx0_q = iio_device_find_channel(rx, "altvoltage1", RXMODE);
      if (rx0_q == NULL)
      {
        processError(CHN_ERROR, debugFlag);
      }
    }
  }
  else
  {
    processError(DEV_ERROR, debugFlag);
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
    processError(PHYS_ERROR, debugFlag);
  }

  // Create the receiver local oscillator
  rx_lo = iio_device_find_channel(physDev, "altvoltage0", true);
  if (rx_lo != NULL)
  {
    iio_channel_attr_write_longlong(rx_lo, ATTR_F.c_str(), rxConfig.lo_hz);
  }
  else
  {
    processError(LO_ERROR, debugFlag);
  }

  if (rx0_i != NULL && rx0_q != NULL)
  {
    iio_channel_enable(rx0_i);
    iio_channel_enable(rx0_q);
    cout << "********** Receiver channels i and q enabled" << endl;
  }
    
  rxBuf = iio_device_create_buffer(rx, MAX_BUFFER_SIZE, NONCYCLIC);

  if (rxBuf == NULL)
  {
    processError(BUF_ERROR, debugFlag);
  }
}

/*void ADRV::initializeBuffer(struct iio_buffer* buffer, mode operation)
{
  if (operation == TXMODE)
  {
    txBuf = buffer;
  }
  else if (operation == RXMODE)
  {
    rxBuf = buffer;
  }
}*/

bool createPacket(const char* strMsg, uint32_t numBytes, uint8_t* packet)
{
  uint8_t* byteArray = (uint8_t*)malloc(numBytes + HEADER_SIZE);
  uint32_t byteArrayIndex = (numBytes + HEADER_SIZE) / sizeof(uint8_t);

  cout << "NUM ELEMENTS: " << byteArrayIndex << endl;
  cout << "CREATING PACKET..." << endl;
  std::memcpy(&byteArray[0], &PACKET_START, 4);
  cout << "1" << endl;
  std::memcpy(&byteArray[4], &numBytes, 4);
  cout << "2" << endl;
  std::memcpy(&byteArray[8], &MESSAGE_START, 4);
  cout << "3" << endl;
  std::memcpy(&byteArray[12], strMsg, numBytes);
  cout << "4" << endl;
  std::memcpy(&byteArray[byteArrayIndex - 8], &MESSAGE_END, 4);
  std::memcpy(&byteArray[byteArrayIndex - 4], &PACKET_END, 4);

  cout << "PACKET CREATED!" << endl;

  for (int i = 0; i < byteArrayIndex; i++)
  {
    printf("BYTE AT %d = %02X\n", i, byteArray[i]);
  }

  packet = byteArray;

	return true;
}