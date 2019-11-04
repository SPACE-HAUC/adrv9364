
#include <iostream>
#include "ADRV.h"

using std::cout;
using std::endl;

ADRV::ADRV()
{
  ADRV_id = 1;
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

