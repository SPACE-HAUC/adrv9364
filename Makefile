CXX = g++
CPPFLAGS = -c -Wall -std=c++11 -fpermissive
OBJ = ADRV.o ADRVTransmitter.o ADRVReceiver.o
DEPS =
LIBS = -liio
EXE = driver

all: $(OBJ)
	$(CXX) -o $(EXE) radioMain.cpp $(OBJ) $(LIBS)

%.o: %.cpp
	$(CXX) $(CPPFLAGS) -o $@ $<

clean:
	rm $(OBJ) $(EXE)
