
#include <iostream>
#include <string>
#include <iio.h>
#include <iomanip>

using std::cout;
using std::endl;

void contextHK(const struct iio_context *ctx)
{
	cout << "********** CONTEXT HOUSE KEEPING **********" << endl;
	const char* name = iio_context_get_name(ctx);
	const char* description = iio_context_get_description(ctx);
	uint32_t attributeCount = iio_context_get_attrs_count(ctx);
	cout << "Context name: " << name << endl;
	cout << "Context description: " << description << endl;
	cout << "Attribute count: " << attributeCount << endl;

	const char** attrName, attrVal;
	for (int i = 0; i < attributeCount; i++)
	{
		int ret = iio_context_get_attr(ctx, i, attrName, attrVal);
		cout << "Attribute Name: " << attrName << " Attribute Value: " << attrVal << endl;
	}

	return;
}

void deviceHK(const struct iio_context *ctx)
{
	cout << "********** DEVICE HOUSEKEEPING **********" << endl;
	struct iio_device* myDevice;

	uint32_t deviceCount = iio_context_get_devices_count(ctx);
	cout << "Device count: " << deviceCount << endl;
	for (int i = 0; i < deviceCount - 1; i++)
	{
		myDevice = iio_context_get_device(ctx, i);
		std::string deviceID = iio_device_get_id(myDevice);
		std::string deviceName = iio_device_get_name(myDevice);
		uint32_t deviceChannelCount = iio_device_get_channels_count(myDevice);
		uint32_t deviceAttributeCount = iio_device_get_attrs_count(myDevice);
		uint32_t deviceBufferAttributeCount = iio_device_get_buffer_attrs_count(myDevice);
		cout << "Device: " << deviceID << " Name: " << deviceName << endl;
		cout << "\tDevice channel count: " << deviceChannelCount;
		cout << " Device attribute count: " << deviceAttributeCount;
		cout << " Device buffer attribute count: " << deviceBufferAttributeCount << endl;

		/*for (int currentReg = 0; currentReg <= 0x356; currentReg++)
		{
			uint32_t regVal;
			uint32_t regReadRET = iio_device_reg_read(myDevice, currentReg, &regVal);
			cout << std::hex << "REGISTER " << currentReg << "VALUE: " << regVal << std::endl;
		}*/

		for (int i = 0; i < deviceAttributeCount; i++)
		{
			std::string devAttrName = iio_device_get_attr(myDevice, i);
			std::string devAttrVal;
			uint32_t devAttrRET = iio_device_attr_read(myDevice, devAttrName.c_str(), devAttrVal.c_str(), 1000);
			//cout << "\t\tDevice attribute " << i << " Name: " << devAttrName << "\t Value: " << devAttrVal << endl;
		}

		/*for (int j = 0; j < deviceBufferAttributeCount; j++)
		{
			string devBufferAttr = iio_device_get_buffer_attr(myDevice, j);
			cout << "Device buffer attribute: " << devBufferAttr << endl;
		}*/
	}
	free(myDevice);
}

void channelHK(const struct iio_context *ctx)
{
	cout << "********** CHANNEL HOUSEKEEPING **********" << endl;
	struct iio_device* myDevice;
	struct iio_channel* myChannel;
	const char* deviceID;
	const char* deviceName;
	const char* channelID;
	const char* channelName;
	const char* chnAttrName; 
	const char* chnAttrFileName;
	char* chnAttrVal;

	uint32_t devCount = iio_context_get_devices_count(ctx);
	for (int i = 0; i < devCount - 1; i++)
	{
		myDevice = iio_context_get_device(ctx, i);
		deviceID = iio_device_get_id(myDevice);
		deviceName = iio_device_get_name(myDevice);
		uint32_t deviceChannelCount = iio_device_get_channels_count(myDevice);
		cout << "DEVICE " << deviceID << "( " << deviceName << " )" << endl;

		for (int j = 0; j < deviceChannelCount; j++)
		{ 
	 		myChannel = iio_device_get_channel(myDevice, j);
			channelID = iio_channel_get_id(myChannel);
		
			channelName = iio_channel_get_name(myChannel);
			cout << channelName << endl;
			
			bool isOUTPUT = iio_channel_is_output(myChannel);
			bool isSCAN = iio_channel_is_scan_element(myChannel);

			uint32_t channelAttributeCount = iio_channel_get_attrs_count(myChannel);

			cout << "Channel: " << channelID << " Name: " << endl;
			cout << "\tChannel attribute count: " << channelAttributeCount;
			cout << " Is output?: " << isOUTPUT;
			cout << " Is scan element?: " << isSCAN << endl;

			for (int k = 0; k < channelAttributeCount; k++)
			{
				chnAttrName = iio_channel_get_attr(myChannel, k);
				chnAttrFileName = iio_channel_attr_get_filename(myChannel, chnAttrName);
				chnAttrVal;

				uint32_t chnAttrRET = iio_channel_attr_read(myChannel, chnAttrName, chnAttrVal, 1000);
				cout << "\t\tChannel attribute " << k;
				cout << " Name: " << chnAttrName << " File name: " << chnAttrFileName;
				cout << "\t Value: " << chnAttrVal << endl;
			}
		}
	}
}

void housekeeping(const struct iio_context *ctx)
{
	contextHK(ctx);
	//deviceHK(ctx);
	channelHK(ctx);
}


int main()
{
	static struct iio_context* ADRV_CONTEXT = iio_create_default_context();
	housekeeping(ADRV_CONTEXT);
	cout << "HOUSE KEEPING COMPLETE.  Destroying context..." << endl;
	iio_context_destroy(ADRV_CONTEXT);
	cout << "Context destroyed...exiting" << endl;
	return 0;
}
