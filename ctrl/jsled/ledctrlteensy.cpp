#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>

#if defined(OS_LINUX) || defined(OS_MACOSX)
#include <sys/ioctl.h>
#include <termios.h>
#elif defined(OS_WINDOWS)
#include <conio.h>
#endif

#include "hid.h"
#include "ledctrl.h"

inline unsigned int min(unsigned int a, unsigned int b)
{
    if (a<b) return a;
    return b;
}

class CmdSetPix
{
  public:
    uint16_t pixelNum;
    uint16_t count;
    unsigned char red;
    unsigned char grn;
    unsigned char blu;
};

enum
{
  CMD_NOP = 0,
  CMD_SET_PIXEL = 1,
  CMD_SET_PIXELS = 2,
  MAX_SET_PIXELS_COUNT = 16,
  CMD_SHOW = 8,
};

LedCtrl::LedCtrl(unsigned int numLeds)
{
    printf("Led control connecting\n");
    int r;
    // C-based example is 16C0:0480:FFAB:0200
    r = rawhid_open(1, 0x16C0, 0x0480, 0xFFAB, 0x0200);
    if (r <= 0)
    {
        // Arduino-based example is 16C0:0486:FFAB:0200
        r = rawhid_open(1, 0x16C0, 0x0486, 0xFFAB, 0x0200);
        if (r <= 0)
        {
            printf("no rawhid device found\n");
            exit(-1);
        }
    }
    printf("found rawhid device\n");
}

LedCtrl::~LedCtrl() {}

void LedCtrl::SetLed(unsigned int i, unsigned char r, unsigned char g, unsigned char b)
{
    char buf[64];
    CmdSetPix p;
    p.pixelNum = i;
    p.count = 1;
    p.red = r;
    p.grn = g;
    p.blu = b;
    buf[0] = CMD_SET_PIXEL;
    memcpy(&buf[1],(char*) &p,sizeof(CmdSetPix));
    rawhid_send(0, buf, 64, 100);
}

void LedCtrl::SetNLed(unsigned int i, unsigned int count, unsigned char r, unsigned char g, unsigned char b)
{
    char buf[64];
    CmdSetPix p;
    p.pixelNum = i;
    p.count = count;
    p.red = r;
    p.grn = g;
    p.blu = b;
    buf[0] = CMD_SET_PIXEL;
    memcpy(&buf[1],(char*) &p,sizeof(CmdSetPix));
    rawhid_send(0, buf, 64, 100);
}


void LedCtrl::SetLeds(unsigned int pxIdx, unsigned int count, uint32_t *buf)
{
    unsigned char usbbuf[64];
    //printf("SetLeds(%d,%d):\n", pxIdx, count);
    for (unsigned int i = 0; i < count; i += MAX_SET_PIXELS_COUNT, pxIdx += MAX_SET_PIXELS_COUNT)
    {
        unsigned char amt2Set = min(count - i, MAX_SET_PIXELS_COUNT);
        usbbuf[0] = CMD_SET_PIXELS;
        memcpy(&usbbuf[1], &pxIdx, 2); // start pixel
        usbbuf[3] = amt2Set;
        uint8_t boff = 4;
        for (int j = 0; j < amt2Set; j++, boff += 3)
        {
            // memcpy(&usbbuf[boff], &buf[i], 3);
            uint32_t val = buf[i+j] & 0x00ffffff;
            usbbuf[boff] = val;
            usbbuf[boff + 1] = val >> 16;
            usbbuf[boff + 2] = val >> 8;
            //printf("  %d+%d: to %d, %d , %d\n", pxIdx, i+j, usbbuf[boff + 1], usbbuf[boff + 2], usbbuf[boff]);
        }
        rawhid_send(0, usbbuf, 64, 100);
        // Irrelevant to the bug: usleep(10000);
    }
}


bool LedCtrl::ShowLeds()
{
    char buf[64];
    buf[0] = CMD_SHOW;
    rawhid_send(0, buf, 64, 100);
    return true;
}
