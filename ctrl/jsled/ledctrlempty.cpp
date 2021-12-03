#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>

#include "/me/hw/chip/jsled/ledctrl.h"

LedCtrl::LedCtrl(unsigned int numLeds)
{

}

LedCtrl::~LedCtrl()
{
}

void LedCtrl::SetLed(unsigned int i, unsigned char r, unsigned char g, unsigned char b)
{
    printf("set %d to (%d,%d,%d)\n", i ,r,g,b);
}
void LedCtrl::SetNLed(unsigned int i, unsigned int count, unsigned char r, unsigned char g, unsigned char b)
{
    printf("set %d..%d to (%d,%d,%d)\n", i, i+count ,r,g,b);

}
void LedCtrl::SetLeds(unsigned int pxIdx, unsigned int count, uint32_t *buf)
{
    printf("set each %d, %d, %p\n", pxIdx, count, buf);
}

bool LedCtrl::ShowLeds()
{
    printf("update leds\n");
    return true;
}
