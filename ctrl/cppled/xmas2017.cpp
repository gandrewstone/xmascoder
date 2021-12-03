#include "ledctrl.h"
#include <utility>
#define NUMPIXELS 500

template <typename T> int sign(T val)
{
    return (T(0) < val) - (val < T(0));
}

void functionalTest(LedCtrl& tree)
{
    uint32_t leds[NUMPIXELS];

    tree.SetNLed(0, NUMPIXELS, 0, 0, 0);
    tree.ShowLeds();
    leds[0] = 0xff0000;
    leds[1] = 0x00ff00;
    leds[2] = 0x0000ff;
    tree.SetLeds(0, 3, leds);
    tree.ShowLeds();
    sleep(1);

    tree.SetLed(0, 0xff,0,0);
    tree.SetLed(1, 0,0xff,0);
    tree.SetLed(2, 0,0,0xff);
    tree.ShowLeds();
    sleep(1);
    tree.SetNLed(0, NUMPIXELS/3,0xff,0,0);
    tree.SetNLed(NUMPIXELS/3, NUMPIXELS/3, 0, 0xff,0);
    tree.SetNLed(2*NUMPIXELS/3, NUMPIXELS/3, 0,0,0xff);
    tree.ShowLeds();
    sleep(1);

}

bool GreenRedFade(LedCtrl& tree, unsigned int sec)
{
    uint32_t leds[NUMPIXELS];
    sec*=1000;
    unsigned int elapsed = 0;
    unsigned char red=0,grn=0,blu=0;
    while (elapsed < sec)
    {
        for (int i = 0; i < NUMPIXELS; i++)
        {
            leds[i] = red<<16 | grn<<8 | blu;
        }
        tree.SetLeds(0,NUMPIXELS,leds);
        usleep(50*1000);
        elapsed += 50;

        if (!tree.ShowLeds()) return false;
        red += 1;
        grn -= 1;
    }
    return true;
}


inline unsigned int Mix(unsigned int red, unsigned int grn, unsigned int blu)
{
    return (red&255)<<16 | (grn&255)<<8 | (blu&255);
}

inline void Demix(unsigned int col, unsigned int &red, unsigned int& grn, unsigned int& blu)
{
    red = (col>>16)&255;
    grn = (col>>8)&255;
    blu = col&255;
}

inline unsigned int Tint(unsigned int col, int red, int grn, int blu)
{
    unsigned int r,g,b;
    Demix(col, r,g,b);
    int tmp;

    tmp = r + (int) red;
    if (tmp > 255) r=255;
    else if (tmp < 0) r=0;
    else r=tmp;
    
    tmp = g + (int) grn;
    if (tmp > 255) g=255;
    else if (tmp < 0) g=0;
    else g=tmp;

    tmp = b + (int) blu;
    if (tmp > 255) b=255;
    else if (tmp < 0) b=0;
    else b=tmp;

    return Mix(r,g,b);
}

inline unsigned int Tint(unsigned int col, unsigned int col2)
{
    unsigned int r,g,b;
    Demix(col2, r,g,b);
    return Tint(col, r,g,b);
}


bool IndividualGreenRedFade(LedCtrl& tree, unsigned int sec)
{
    uint32_t leds[NUMPIXELS];
    char dirs[NUMPIXELS][3];
    sec*=1000;
    unsigned int elapsed = 0;

    for (int i = 0; i < NUMPIXELS; i++)
    {
        leds[i] = Mix( (i&1) ? 0xFF:0, (i&1) ? 0:0xFF,0);
        if (i&1)
        {
        dirs[i][0] = 1;
        dirs[i][1] = -1;
        dirs[i][2] = 0;
        }
        else
        {
        dirs[i][0] = -1;
        dirs[i][1] = 1;
        dirs[i][2] = 0;
            
        }
    }

    while (elapsed < sec)
    {
        tree.SetLeds(0,NUMPIXELS,leds);
        usleep(50*1000);
        elapsed += 50;
        if (!tree.ShowLeds()) return false;

        for (int i = 0; i < NUMPIXELS; i++)
        {
            unsigned int r,g,b;
            Demix(leds[i], r,g,b);

            r += dirs[i][0];
            g += dirs[i][1];
            b += dirs[i][2];
            leds[i] = Mix( r,g,b);
        }
    }
    return true;
}

class Sprite
{
public:
    Sprite(uint32_t color, unsigned int startp, unsigned int endp, int dirp):
        col(color), start(startp), end(endp), dir(dirp)
    {
        pos=start;
        if (start > end)
        {
            std::swap(start,end);
        }
    }
    uint32_t col;
    unsigned int start;
    unsigned int end;
    unsigned int pos;
    int dir;

    void Advance(uint32_t* leds)
    {
        unsigned int newpos = pos + dir;
        int newdir = dir;
        if (newpos >= end) { newpos=end; newdir=-dir;}
        if (newpos <= start) { newpos=start; newdir=-dir;}

        dir = newdir;
        pos = newpos;
        leds[pos] = Tint(leds[pos], col);
    }
};



bool Travel(LedCtrl& tree, unsigned int sec)
{
    sec*=1000;
    unsigned int elapsed = 0;
    uint32_t leds[NUMPIXELS];

    for (int i = 0; i < NUMPIXELS; i++)
        leds[i] = 0;

    Sprite s[2] = { {0x00ff0000,0,NUMPIXELS-1,1}, {0x0000ff00,NUMPIXELS-1,0,-1} };
    while (elapsed < sec)
    {
        for (int i = 0; i < NUMPIXELS; i++)
        {
            leds[i] = Tint(leds[i], -2, -2, -2);
        }
        s[0].Advance(leds);
        s[1].Advance(leds);
        usleep(50*1000);
        elapsed += 50;
        tree.SetLeds(0,NUMPIXELS,leds);
        if (!tree.ShowLeds()) return false;
    }
    return true;
}

int main()
{
    LedCtrl tree(NUMPIXELS);

    while (1)
    {
        if (!Travel(tree, 60)) break;
        if (!IndividualGreenRedFade(tree, 30)) break;
        if (!GreenRedFade(tree, 30)) break;
    }
}
