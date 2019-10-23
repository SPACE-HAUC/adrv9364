
#include <iostream>
#include <string>

#include <iio.h>

void contextHK(const struct iio_context *ctx)
{
	std::cout << "********** CONTEXT HOUSE KEEPING **********" << std::endl;
	char* name = iio_context_get_name(ctx);
	char* description = iio_context_get_description(ctx);
	uint32_t attributeCount = iio_context_get_attrs_count(ctx);
	std::cout << "Context name: " << name << std::endl;
	std::cout << "Context description: " << description << std::endl;
	std::cout << "Attribute count: " << attributeCount << std::endl;

	std::string attrName, attrVal;
	for (int i = 0; i < attributeCount; i++)
	{
		int ret = iio_context_get_attr(ctx, i, *attrName.c_str(), *attrVal.c_str());
		std::cout << "Attribute Name: " << attrName << " Attribute Value: " << attrVal << std::endl;
	}
	uint32_t deviceCount = iio_context_get_devices_count(ctx);
	std::cout << "Device count: " << deviceCount << std::endl;
	struct iio_device* myDevice;
	for (int i = 0; i < deviceCount - 1; i++)
	{
		myDevice = iio_context_get_device(ctx, i);
		std::string deviceID = iio_device_get_id(myDevice);
		std::string deviceName = iio_device_get_name(myDevice);
		uint32_t deviceChannelCount = iio_device_get_channels_count(myDevice);
		uint32_t deviceAttributeCount = iio_device_get_attrs_count(myDevice);
		uint32_t deviceBufferAttributeCount = iio_device_get_buffer_attrs_count(myDevice);
		std::cout << "Device: " << deviceID << " Name: " << deviceName << std::endl; 
		std::cout << "\tDevice channel count: " << deviceChannelCount << " Device attribute count: " << deviceAttributeCount << " Device buffer attribute count: " << deviceBufferAttributeCount << std::endl;
		
		for (int i = 0; i < deviceAttributeCount; i++)
		{
			std::string devAttrName = iio_device_get_attr(myDevice, i);
			std::string devAttrVal;
			uint32_t devAttrRET = iio_device_attr_read(myDevice, devAttrName.c_str(), devAttrVal.c_str(), 1000);
			std::cout << "\t\tDevice attribute " << i << " Name: " << devAttrName << "\t Value: " << devAttrVal << std::endl;
		}		
	}
	std::cout << "DONE LOOP" << std::endl;
	free(myDevice);
	return;
}

int main()
{
	static struct iio_context* ADRV_CONTEXT = iio_create_default_context();
	contextHK(ADRV_CONTEXT);
	std::cout << "DONE" << std::endl;
	iio_context_destroy(ADRV_CONTEXT);
	std::cout << "DONE" << std::endl;
	return 0;
}
