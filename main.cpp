
#include <iostream>
#include "ADRV.h"

using std::cout;
using std::endl;

int main()
{
  ADRV_transmitter t1;
  ADRV_transmitter t2(50, 50, 50, "PORT A");
  ADRV_receiver r1;
  ADRV_receiver r2(50, 50, 50, "PORT B");

  uint32_t* TXBUF;
  uint32_t* RXBUF;

  cout << "********** STATUS MESSAGES **********" << endl;
  t1.printObject();
  t2.printObject();
  r1.printObject();
  r2.printObject();
  cout << "********** STATUS MESSAGES **********" << endl;

  uint32_t sampleData[100];
  char* helloWorld = "Hello World!";

  for (int i = 0; i < 100; i++)
  {
    sampleData[i] = i;
    //cout << "INDEX i = " << i << ": " << sampleData[i] << endl;
  }

  t2.transmit((void*)helloWorld, sizeof(helloWorld), TXBUF);
  r2.receive((void*)TXBUF, RXBUF);

  return 0;

}
