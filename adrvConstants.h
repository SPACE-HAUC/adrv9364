
#ifndef ADRVCONSTANTS_H
#define ADRVCONSTANTS_H
#include <iio.h>

#define MHZ(x) ((long long)(x * 1000000.0 + 0.5))
#define GHZ(x) ((long long)(x * 1000000000.0 + 0.5))

enum iodev { TX = 0, RX = 1 };


#endif
