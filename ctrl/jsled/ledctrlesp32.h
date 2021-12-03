#ifndef LEDCTRL_H
#define LEDCTRL_H
#include <stdint.h>
#include <unistd.h>
#include <string>

#define NUMLEDS 8*500

#define MAX_PKT_PAYLOAD_SIZE 1450

class LedCtrl
{
protected:
    int sock=-1;
    int32_t syncCount = 0;
    unsigned int ledsPerStrand;
    unsigned char *buf;
    bool isConnected=false;
    std::string nodeAddress;
    struct addrinfo *addr;
    int addrLen;
    uint8_t q[MAX_PKT_PAYLOAD_SIZE];
    size_t qPos=0;

    void reconnect();
    int sendRetry(uint8_t* buf, size_t total);
    int enqueueCmd(uint8_t* buf, size_t total, bool flush = false);
public:
    void disconnect();
    LedCtrl(std::string ip, unsigned int numLeds, unsigned int ledsPerStrand=500);
    ~LedCtrl();
    void SetLed(unsigned int i, unsigned char r, unsigned char g, unsigned char b, bool show=false);
    void SetNLed(unsigned int i, unsigned int count, unsigned char r, unsigned char g, unsigned char b, bool show=false);
    void SetLeds(unsigned int pxIdx, unsigned int count, uint32_t *buf, bool show=false);
    bool ShowLeds(); // returns false to quit on some platforms

    void FadeLed(unsigned int i, unsigned int fadeCount, unsigned char r, unsigned char g, unsigned char b, bool show=false);
    void FadeNLed(unsigned int i, unsigned int count, unsigned int fadeCount, unsigned char r, unsigned char g, unsigned char b, unsigned int stride = 1, bool show=false);

    // Without disturbing the fade target or end time, set the LED to something else (creates a flash effect)
    void YankLed(unsigned int i, unsigned char r, unsigned char g, unsigned char b, bool show=false);
    void YankNLed(unsigned int i, unsigned int count, unsigned char r, unsigned char g, unsigned char b, unsigned int stride, bool show=false);

    // Rotates LEDS, without disturbing the fading (fading moves along too).  Negative stride goes backwards.
    void Rotate(unsigned int i, unsigned int count, int stride, bool show = false);

    bool Sync(int timeout=1000*1000);  // Wait for completion of prior commands, max timeout ms
    bool SyncDelay(int minWaitUSeconds, int timeout=1000*1000);  // Wait for completion of prior commands for a minimum time
    bool DelayUntil(int msSinceStart);  // Tell device to wait until a certain # of ms since connection opened.
    bool Delay(int uSeconds); // target pauses execution for passed microseconds
};

extern uint64_t GetStopwatch();
#endif
