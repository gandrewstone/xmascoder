#ifndef LEDCTRL_H
#define LEDCTRL_H
#include <stdint.h>
#include <unistd.h>

#define NUMLEDS 800

class LedCtrl
{
public:
    LedCtrl(unsigned int numLeds);
    ~LedCtrl();
    void SetLed(unsigned int i, unsigned char r, unsigned char g, unsigned char b);
    void SetNLed(unsigned int i, unsigned int count, unsigned char r, unsigned char g, unsigned char b);
    void SetLeds(unsigned int pxIdx, unsigned int count, uint32_t *buf);
    bool ShowLeds(); // returns false to quit on some platforms
};

extern uint64_t GetStopwatch();
#endif
