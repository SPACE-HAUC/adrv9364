
#ifndef ADRV_H
#define ADRV_H
struct stream_cfg
{
  long long bw_hz;
  long long fs_hz;
  long long lo_hz;
  const char* rfport;
};

class ADRV
{
public:
  ADRV();
  ~ADRV();
  virtual void printID();
  virtual void printObject();
protected:
  int ADRV_id;
};

class ADRV_transmitter : public ADRV
{
public:
  // Done
  ADRV_transmitter();
  // Done
  ADRV_transmitter(long long bandwidth, long long sampleFreq, long long loFreq,
                    const char* radioPort);
  // Done
  ~ADRV_transmitter();
  // Done
  void printID();
  // Done
  void printObject();
  // Done
  void transmit(void* txBuf, uint32_t bufSize, uint32_t *TXPKT);
private:
  struct stream_cfg transmitterConfig;
};

class ADRV_receiver : public ADRV
{
public:
  ADRV_receiver();
  ADRV_receiver(long long bandwidth, long long sampleFreq, long long loFreq,
                const char* radioPort);
  ~ADRV_receiver();
  void printID();
  void printObject();
  void receive(void* rxBuf, uint32_t *RXPKT);
private:
  struct stream_cfg receiverConfig;
};

#endif
