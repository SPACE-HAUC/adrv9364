
#include <iostream>
#include "ADRV.h"

using std::cout;
using std::endl;

ADRV::ADRV()
{
  ADRV_id = 1;
  myContext = iio_create_default_context();
  contextDeviceCount = iio_context_get_devices_count(myContext);
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

void ADRV::contextHK()
{
  cout << "********** CONTEXT HOUSE KEEPING **********" << endl;
  const char* name = iio_context_get_name(myContext);
  const char* description = iio_context_get_description(myContext);
  uint32_t attributeCount = iio_context_get_attrs_count(myContext);
  uint32_t devCount = iio_context_get_devices_count(myContext);
  cout << "Context name: " << name << endl;
  cout << "Context description: " << description << endl;
  cout << "Device count: " << devCount << endl;
  cout << "Attribute count: " << attributeCount << endl;

  const char** attrName, attrVal;
  for (int i = 0; i < attributeCount; i++)
  {
    int ret = iio_context_get_attr(myContext, i, attrName, attrVal);
    cout << "Attribute Name: " << attrName << " Attribute Value: " << attrVal << endl;
  }

  return;
}
