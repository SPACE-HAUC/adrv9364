#include <unistd.h>
#include "ADRV.h"
#include <stdlib.h>
#include <cstring>

bool debugFlag = true;

bool initADRV()
{
    bool initFlag = false;
    ctx = iio_create_default_context();
    if (ctx != NULL)
    {
        physDev = iio_context_find_device(ctx, AD9361PHYS.c_str());
        if (physDev != NULL)
        {
            initFlag = true;
            cout << "ADRV INITIALIZED" << endl;
        }
    }
    return initFlag;
}

bool processError(errorCode error, bool debug)
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


bool initTX(struct stream_cfg* transmitterConfig)
{
    txConfig = *transmitterConfig;
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

bool initRX(struct stream_cfg* receiverConfig)
{
    rxConfig = *receiverConfig;
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

bool createPacket(const char* strMsg, uint32_t numBytes, uint32_t** packet, uint32_t* numBytesRet)
{
    uint32_t* byteArray = (uint32_t*)malloc(numBytes + HEADER_SIZE);
    uint32_t byteArrayIndex = (numBytes + HEADER_SIZE) / sizeof(uint32_t);

    cout << "NUM ELEMENTS: " << byteArrayIndex << endl;
    cout << "CREATING PACKET..." << endl;

    std::memcpy(&byteArray[0], &PACKET_START, 4);
    cout << "1" << endl;
    memcpy(&byteArray[1], &numBytes, 4);
    cout << "2" << endl;
    for ( int i = 0 ; i < numBytes ; i++ )
    {
        uint32_t temp = ((uint32_t)(strMsg[i]))<<4 ;
        memcpy(&byteArray[3+4*i], &temp, 4) ;
    }
    memcpy(&byteArray[2], &MESSAGE_START, 4);
    cout << "3" << endl;
    memcpy(&byteArray[3], strMsg, numBytes);
    cout << "4" << endl;
    memcpy(&byteArray[byteArrayIndex - 2], &MESSAGE_END, 4);
    memcpy(&byteArray[byteArrayIndex - 1], &PACKET_END, 4);

    cout << "PACKET CREATED!" << endl;

    for (uint32_t i = 0; i < byteArrayIndex; i++)
    {
        printf("0x%08X ", byteArray[i]);
    }
    printf("\n") ;
    *packet = byteArray;
    *numBytesRet = (numBytes + HEADER_SIZE);
    return true;
}

bool writePacketToBuffer(uint32_t* packet, uint32_t numBytes)
{
    int i = 0;
    cout << "WRITE: PACKET TO BUFFER" << endl;
    for (uint32_t* ptr = (uint32_t*)iio_buffer_first(txBuf, tx0_i); ptr < iio_buffer_end(txBuf) && i < numBytes; ptr += iio_buffer_step(txBuf))
    {
        *ptr = packet[i];
        i++;
    }
    cout << "WRITING COMPLETE" << endl;
    return true;
}

bool readBufferToPacket(uint32_t packet[50], uint32_t* numBytesRet)
{
    cout << "READ: BUFFER TO PACKET" << endl;
    int i = 0;

    uint32_t* temp_ptr = (uint32_t*)iio_buffer_first(rxBuf, rx0_i);

    cout << *temp_ptr << endl;
    cout << "I PRINTED A THING" << endl;



    for (uint32_t* ptr = (uint32_t*)iio_buffer_first(rxBuf, rx0_i); ptr < iio_buffer_end(rxBuf) && i < 32; ptr += iio_buffer_step(rxBuf))
    {
        cout << "BUF at i = " << i << ": " << *ptr << endl;
        packet[i] = (*ptr)>>4;
        i++;
    }
    *numBytesRet = i; 
    cout << "READING COMPLETE" << endl;
    return true;
}

bool transmit()
{
    size_t nbytes_tx = 0;
    nbytes_tx = iio_buffer_push(txBuf);
	cout << "BYTES PUSHED: " << nbytes_tx << endl;
    return true;
}

int receive()
{
    int nbytes_rx = 0;
    nbytes_rx = iio_buffer_refill(rxBuf);
    if ( nbytes_rx <= 0 )
    cout << "BYTES RECEIVED: " << nbytes_rx << endl;
    return nbytes_rx;
}


