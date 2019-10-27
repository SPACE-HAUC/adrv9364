
#include <iostream>
#include <string>
#include <iio.h>
#include <signal.h>
#include "adrvConstants.h"

using std::cout;
using std::endl;
	

static struct iio_context* ADRV_CONTEXT = NULL;
static struct iio_channel* tx0_q = NULL;
static struct iio_channel* tx0_i = NULL;
static struct iio_buffer* txbuf = NULL;

static bool stop;
struct stream_cfg
{
	long long bandwidth;
	long long sampleFreq;
	long long LOFreq;
	const char* rfport;
};

enum state { ERROR, SUCCESS };

static void shutdown(bool statusFlag)
{
	if (statusFlag == SUCCESS)
	{
		cout << "DESTROYING BUFFERS" << endl;
		if (txbuf != NULL) 
		{	 
			iio_buffer_destroy(txbuf); 
		}
		cout << "DISABLE TRANSMIT CHANNELS" << endl;
		if (tx0_q != NULL) 
		{	 
			iio_channel_disable(tx0_q); 
		}
		if (tx0_i != NULL) 
		{ 
			iio_channel_disable(tx0_i); 
		}
		cout << "DESTROYING CONTEXT" << endl;
		if (ADRV_CONTEXT != NULL) 
		{	 
			iio_context_destroy(ADRV_CONTEXT); 
		}
	}
	else
	{
		cout << "SHUTDOWN DUE TO ERROR" << endl;
	}
}

int main()
{
	const char* ddsCore = "cf-ad9361-dds-core-lpc";
	const char* adphysName = "ad9361-phy";
	const char* txPort = "A";
	struct iio_device* tx;
	struct iio_device* ad_phys;
	static struct iio_channel* tx_LO;
	size_t ntx = 0;
	struct stream_cfg tx_config;

	cout << "CONFIGURING..." << endl;
	tx_config.bandwidth = 80;
	tx_config.sampleFreq = 120;
	tx_config.LOFreq = 100;
	tx_config.rfport = txPort;
	cout << "CONFIGURATION SET" << endl;
	ADRV_CONTEXT = iio_create_default_context();

	cout << "TX" << endl;	
	tx = iio_context_find_device(ADRV_CONTEXT, ddsCore);
	cout << "PHYS" << endl;
	ad_phys = iio_context_find_device(ADRV_CONTEXT, adphysName);

	cout << "QUAD" << endl;	
	tx0_q = iio_device_find_channel(ad_phys, "voltage0", true);
	cout << "IN PHASE" << endl;
	tx0_i = iio_device_find_channel(ad_phys, "voltage1", true);
	cout << "LO" << endl;
	tx_LO = iio_device_find_channel(ad_phys, "altvoltage1", true);
	int attWRITE = iio_channel_attr_write(tx0_q, "rf_port_select", tx_config.rfport);
	attWRITE = iio_channel_attr_write_longlong(tx0_q, "rf_bandwidth", tx_config.bandwidth);
	attWRITE = iio_channel_attr_write_longlong(tx0_q, "sampling_frequency", tx_config.sampleFreq);
	attWRITE = iio_channel_attr_write_longlong(tx_LO, "frequency", tx_config.LOFreq);

	iio_channel_enable(tx0_q);
	iio_channel_enable(tx0_i);

	long long bufsize = 1024 * 1024;
	txbuf = iio_device_create_buffer(tx, bufsize, false);

	if (tx != NULL)
	{
		cout << "TRANSMITTER CREATED" << endl;
	}
	else if (tx == NULL)
	{
		cout << "ERROR - COULD NOT FIND TRANSMITTER" << endl;
		shutdown(ERROR);
	}	
	shutdown(SUCCESS);
	return 0;
}

