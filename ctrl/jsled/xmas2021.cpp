#include "ledctrlesp32.h"
#include <stdio.h>
#include <utility>
#include <ctime>
#include <cstdlib>
#define NUMPIXELS 300*3

template <typename T> int sign(T val)
{
    return (T(0) < val) - (val < T(0));
}

void functionalTest(LedCtrl& tree)
{
    printf("functionalTest\n");
    uint32_t leds[NUMPIXELS];

    tree.SetNLed(0, NUMPIXELS, 0, 0, 0);
    tree.ShowLeds();
    leds[0] = 0xff0000;
    leds[1] = 0x00ff00;
    leds[2] = 0x0000ff;
    tree.SetLeds(0, 3, leds);
    tree.ShowLeds();
    sleep(1);
    tree.Sync();

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
    tree.Sync();
}

bool GreenRedAlternate(LedCtrl& tree, unsigned int sec)
{
    printf("GreenRedAlternate\n");
    sec*=1000;
    unsigned char red=30,grn=30;
    int i=0;
    int opp=0;
    uint64_t start = GetStopwatch()/(1000*1000);
    while ((GetStopwatch()/(1000*1000)) - start < sec)
    {
        tree.SetLed(i+opp,red, 0, 0);
        i++;
        tree.SetLed(i+opp,0, grn, 0);
        i++;
        if (i>NUMPIXELS) {
            i=0;
            red++;
            grn++;
            if (!tree.ShowLeds()) return false;
            opp = !opp;
            tree.Sync();
        }
    }
    return true;
}

bool YellowPurpleBy2(LedCtrl& tree, unsigned int sec)
{
    printf("YellowPurpleBy2\n");
    sec*=1000;
    unsigned char red=30,grn=30;
    int j=0;
    int i=0;
    int opp=0;
    uint64_t start = GetStopwatch()/(1000*1000);
    while ((GetStopwatch()/(1000*1000)) - start < sec)
    {
        tree.SetLed(i+opp,red, red, 0);
        i++;
        tree.SetLed(i+opp,red, red, 0);
        i++;
        tree.SetLed(i+opp,grn, 0, grn);
        i++;
        tree.SetLed(i+opp,grn, 0, grn);
        i++;
        if ((i&255)==0) tree.Sync();
        if (i>NUMPIXELS)
        {
            j++;
            if (j==4) j=0;
            i=j;
            red++;
            grn++;
            if (!tree.ShowLeds()) return false;
            tree.Sync();
            opp = !opp;
        }
    }
    return true;
}


bool GreenRedFade(LedCtrl& tree, unsigned int sec)
{
    printf("GreenRedFade\n");
    const int NumPx = NUMPIXELS;
    sec*=1000;
    uint64_t start = GetStopwatch()/(1000*1000);
    while ((GetStopwatch()/(1000*1000)) - start < sec)
    {
        tree.FadeNLed(0,NumPx,50, 255,0,0);
        if (!tree.ShowLeds()) return false;
        tree.SyncDelay(100*10000);
        tree.FadeNLed(0,NumPx,50, 0,255,0);

        for (uint i=0;i<10;i++)
        {
            tree.Delay(50*1000);
            tree.YankNLed(i, NumPx, 255,255,80, 11);
        }
        tree.Sync();

        //tree.SyncDelay(100*10000);

        tree.FadeNLed(0,NumPx,50, 255,0,0, 2);
        tree.FadeNLed(1,NumPx,50, 0,128,0, 2);
        tree.SyncDelay(200*10000);

        tree.FadeNLed(0,NumPx,50, 0,255,0,2);
        tree.FadeNLed(1,NumPx,50, 255,0,0,2);
        tree.SyncDelay(200*10000);

        for (int j=0;j<25;j++)
        {
            tree.FadeNLed(j,NumPx,50, 32,0,0, 8);
            tree.FadeNLed(j+1,NumPx,50, 64,0,0, 8);
            tree.FadeNLed(j+2,NumPx,50, 128,0,0, 8);
            tree.FadeNLed(j+3,NumPx,50, 255,0,0, 8);
            tree.FadeNLed(j+4,NumPx,50, 0,255,0, 8);
            tree.FadeNLed(j+5,NumPx,50, 0,128,0, 8);
            tree.FadeNLed(j+6,NumPx,50, 0,64,0, 8);
            tree.FadeNLed(j+7,NumPx,50, 0,32,0, 8);
            tree.Delay(100*10000);
            tree.Sync();
        }

    }
    return true;
}


// red << 16, green << 8, blue
const unsigned int RED =  0x00ff0000;
const unsigned int REDM = 0x00800000;
const unsigned int REDD = 0x00200000;

const unsigned int SKYBLUE =  0x00ffff;
const unsigned int SKYBLUEM = 0x008080;
const unsigned int SKYBLUED = 0x002020;

const unsigned int YELLOW =  0x00ffff00;
const unsigned int YELLOWM = 0x00808000;
const unsigned int YELLOWD = 0x00202000;

const unsigned int PURPLE =  0x00ff00ff;
const unsigned int PURPLEM = 0x00800080;
const unsigned int PURPLED = 0x00200020;

const unsigned int BLUE  = 0x000000ff;
const unsigned int BLUEM = 0x00000080;
const unsigned int BLUED = 0x00000020;

const unsigned int ORANGE = 0x0ff8000;
const unsigned int ORANGEM = 0x00804000;
const unsigned int ORANGED = 0x00201000;

const unsigned int GREEN  = 0x0000ff00;
const unsigned int GREENM = 0x00008000;
const unsigned int GREEND = 0x00002000;

const unsigned int WHITE  = 0x00ffffff;
const unsigned int WHITEM = 0x00808080;
const unsigned int WHITED = 0x00202020;

const unsigned int BLACKNZ  = 0x00010000;



bool AllManyColors(LedCtrl& tree, unsigned int sec, int numSparkles, unsigned int sparkleCol=0)
{
    printf("AllManyColors\n");
    uint32_t cols[] = { REDD, BLUED, GREEND, SKYBLUED, YELLOWD, PURPLED, ORANGEM, WHITED, BLACKNZ, 0 }; // RED, YELLOW, PURPLE, BLUE, GREEN, WHITE, 0 };
    //uint32_t leds[NUMPIXELS];
    uint32_t cpos = 0;
    sec*=1000;
    uint64_t start = GetStopwatch()/(1000*1000);
    int32_t sleep = 10000;
    int32_t sdec = 100;
    int count=0;
    while ((GetStopwatch()/(1000*1000)) - start < sec)
    {
        count++;
        usleep(50000);
        uint32_t col = cols[cpos];
        /*
        for (int i = 0; i < NUMPIXELS; i++)
        {
            leds[i] = col;
            }*/
        //tree.SetLeds(0,NUMPIXELS,leds);
        tree.SetNLed(0,NUMPIXELS, col&255, (col>>8)&255, (col>>16)&255);
        if (!tree.ShowLeds()) return false;
        if ((count&31)==0) tree.Sync();  // don't get ahead
        cpos++;
        if (cols[cpos] == 0) cpos = 0;  // If I see a black, its the end of the color array
        if (sleep > 0 )
        {
            if (numSparkles)
            {
                int64_t start1 = GetStopwatch()/(1000*1000);
                while (((int64_t)GetStopwatch()/(1000*1000)) - start1 < sleep)
                {
                    int seed = GetStopwatch();
                    srand (seed);
                    for (int j=0; j<numSparkles; j++)
                    {
                        unsigned int led = rand()%NUMPIXELS;
                        tree.SetLed(led, (sparkleCol>>16)&255, (sparkleCol>>8)&255, sparkleCol&255);
                    }
                    if (!tree.ShowLeds()) return false;
                    usleep(50000);
                    srand (seed);
                    for (int j=0; j<numSparkles; j++)
                    {
                        unsigned int led = rand()%NUMPIXELS;
                        tree.SetLed(led, (col>>16)&255, (col>>8)&255, col&255);
                    }
                }

            }
            else usleep(sleep);
        }
        sleep -= sdec;
        sdec -= 5;
    }
    return true;
}



bool CheckLeds(LedCtrl& tree, unsigned int sec)
{
    printf("CheckLeds\n");

    sec*=1000; // make it milliseconds
    unsigned char red=100,grn=0,blu=0;
    uint64_t start = GetStopwatch()/(1000*1000);
    while ((GetStopwatch()/(1000*1000)) - start < sec)
    {
        tree.SetNLed(0,NUMPIXELS,0,0,0, true);
        //tree.ShowLeds();
        usleep(100*1000);
        for (int i = 0; i < NUMPIXELS; i++)
        {
            tree.SetLed(0,((i&2)>0)*200, ((i&4)>0)*200, ((i&8)>0)*200);
            tree.SetLed(i,red, grn, blu);
            usleep(1*1000);
            if (!tree.ShowLeds()) return false;
        }
        tree.Sync();
        tree.SetNLed(0,NUMPIXELS,0,0,0,true);
        //tree.ShowLeds();
        usleep(100*1000);
        int strandGap=NUMPIXELS/4;
        red=0; grn=50; blu=10;
        for (int i = 0; i < NUMPIXELS/4; i++)
        {
            //leds[i] = red<<16 | grn<<8 | blu;
            tree.SetLed(i,red, grn, blu);
            tree.SetLed(i+strandGap,50, 50, 0);
            tree.SetLed(i+strandGap*2,0, 0, 50);
            tree.SetLed(i+strandGap*3,50, 0, 50);
            usleep(5*1000);
            if (!tree.ShowLeds()) return false;
        }
        tree.Sync();
        tree.SetNLed(0,NUMPIXELS, 255,255,255);
        tree.ShowLeds();
        usleep(500*1000);
    }
    return true;
}

inline unsigned int Mix(unsigned int red, unsigned int grn, unsigned int blu)
{
    return (red&255)<<16 | (grn&255)<<8 | (blu&255);
}

inline void Demix(unsigned int col, int &red, int& grn, int& blu)
{
    red = (col>>16)&255;
    grn = (col>>8)&255;
    blu = col&255;
}

inline unsigned int Tint(unsigned int col, int red, int grn, int blu)
{
    int r,g,b;
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
    int r,g,b;
    Demix(col2, r,g,b);
    return Tint(col, r,g,b);
}


bool IndividualGreenRedFade(LedCtrl& tree, unsigned int sec)
{
    uint32_t leds[NUMPIXELS];
    char dirs[NUMPIXELS][3];
    sec*=1000;
    printf("IndividualGreenRedFade\n");

    for (int i = 0; i < NUMPIXELS; i++)
    {
        leds[i] = Mix( (i&1) ? 0xFF:0, (i&1) ? 0:0xFF,0);
        if (i&1)
        {
            dirs[i][0] = 2 + rand()%5;
            dirs[i][1] = -3 - rand()%4;
            dirs[i][2] = 0;
        }
        else
        {
            dirs[i][0] = -5 - rand()%9;
            dirs[i][1] = 7 + rand()%5;
            dirs[i][2] = 0;
        }
    }

    uint64_t start = GetStopwatch()/(1000*1000);
    while ((GetStopwatch()/(1000*1000)) - start < sec)
    {
        tree.SetLeds(0,NUMPIXELS,leds);
        if (!tree.ShowLeds()) return false;
        tree.SyncDelay(1000);

        for (int i = 0; i < NUMPIXELS; i++)
        {
            int r,g,b;
            Demix(leds[i], r,g,b);

            r += dirs[i][0];
            g += dirs[i][1];
            b += dirs[i][2];
            if (r<0)
            {
                r=0;
                dirs[i][0] *= -1;
                dirs[i][0] += rand()%5 - 2;
                if (dirs[i][0] == 0) dirs[i][0] = 3;
            }
            if (g<0)
            {
                g=0;
                dirs[i][1] *= -1;
                dirs[i][1] += rand()%5 - 2;
                if (dirs[i][1] == 0) dirs[i][1] = 3;
            }
            if (b<0)
            {
                b=0;
                dirs[i][2] *= -1;
            }
            if (r>255)
            {
                r=255;
                dirs[i][0] *= -1;
            }
            if (g>255)
            {
                g=255;
                dirs[i][1] *= -1;
            }
            if (b>255)
            {
                b=255;
                dirs[i][2] *= -1;
            }

            leds[i] = Mix( r,g,b);
        }
    }
    return true;
}


bool Marquee(LedCtrl& tree, unsigned int sec)
{
    uint32_t ccols[] = { REDD, BLUED, GREEND, SKYBLUED, YELLOWD, PURPLED, ORANGEM, WHITED, BLACKNZ, RED, YELLOW, PURPLE, BLUE, GREEN, WHITE, 0 };
    uint32_t lleds[NUMPIXELS];
    sec*=1000;

    uint64_t start = GetStopwatch()/(1000*1000);

    int j = 0;
    unsigned int cidx = 0;
    while ((GetStopwatch()/(1000*1000)) - start < sec)
    {
        for (int i = 0; i < NUMPIXELS; i++)
        {
            if (cidx >= (sizeof(ccols)/sizeof(uint32_t))) cidx = 0;
            int c = ccols[cidx];
            lleds[i] = c;
            cidx++;
        }
        tree.SetLeds(0,NUMPIXELS,lleds);
        tree.SyncDelay(50000);
        j++;
        cidx = j%(sizeof(ccols)/sizeof(uint32_t));
    }
    return true;
}

bool MarqueeRotate(LedCtrl& tree, unsigned int sec)
{
    uint32_t ccols[] = { REDD, BLUED, GREEND, SKYBLUED, YELLOWD, PURPLED, ORANGEM, WHITED, BLACKNZ, RED, YELLOW, PURPLE, BLUE, GREEN, WHITE, 0 };
    uint32_t lleds[NUMPIXELS];
    sec*=1000;

    uint64_t start = GetStopwatch()/(1000*1000);

    unsigned int cidx = 0;
    for (int i = 0; i < NUMPIXELS; i++)
        {
            if (cidx >= (sizeof(ccols)/sizeof(uint32_t))) cidx = 0;
            int c = ccols[cidx];
            lleds[i] = c;
            cidx++;
        }
        tree.SetLeds(0,NUMPIXELS,lleds);
    while ((GetStopwatch()/(1000*1000)) - start < sec)
    {
        tree.Rotate(0,NUMPIXELS,1);
        tree.SyncDelay(50000);
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
    printf("travel\n");
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
        usleep(1*1000);
        elapsed += 20;
        tree.SetLeds(0,NUMPIXELS,leds);
        if (!tree.ShowLeds()) return false;
    }
    return true;
}


void test(LedCtrl& tree)
{
    printf("test\n");
    const int visibleLen = 50;
    const int strandLen = 100;
    const int delayTime = 40000;
    int64_t start = GetStopwatch()/1000;
    tree.SetNLed(0,NUMPIXELS, 0, 0, 0);
    tree.ShowLeds();

    for (int j=1;j<5;j++)
    {
    for (int i=0;i<visibleLen;i++)
    {
        tree.SetLed((i-1)%visibleLen, 5, 0, 0);
        tree.SetLed((i)%visibleLen, (j*5)&255, 80, (i*10)&255);

        tree.SetLed(strandLen+((i-1)%visibleLen), 0, 5, 0);
        tree.SetLed(strandLen+((i)%visibleLen), 80, (j*5)&255, (i*10)&255);

        tree.SetLed(2*strandLen+((i-1)%visibleLen), 0, 5, 0);
        tree.SetLed(2*strandLen+((i)%visibleLen), 80, (j*5)&255, (i*10)&255);

        tree.SetLed(3*strandLen+((i-1)%visibleLen), 0, 0, 5);
        tree.SetLed(3*strandLen+((i)%visibleLen), 80, (j*5)&255, (i*10)&255);

        tree.SetLed(4*strandLen+((i-1)%visibleLen), 5, 0, 5);
        tree.SetLed(4*strandLen+((i)%visibleLen), 80, (j*5)&255, (i*10)&255);

        tree.SetLed(5*strandLen+((i-1)%visibleLen), 0, 5, 5);
        tree.SetLed(5*strandLen+((i)%visibleLen), 80, (j*5)&255, (i*10)&255);

        tree.SetLed(6*strandLen+((i-1)%visibleLen), 5, 5, 0);
        tree.SetLed(6*strandLen+((i)%visibleLen), 80, (j*5)&255, (i*10)&255);

        // Orange
        tree.SetLed(7*strandLen+((i-1)%visibleLen), 10, 5, 0);
        tree.SetLed(7*strandLen+((i)%visibleLen), 80, (j*5)&255, (i*10)&255);

        
        //tree.SetLed(i, 100, 50, 20);
        tree.ShowLeds();
        tree.Delay(delayTime);
        //tree.ShowLeds();
        //tree.Delay(delayTime);
        //tree.ShowLeds();
        //tree.Delay(delayTime);
        //tree.ShowLeds();
        //tree.Delay(delayTime);
        tree.Sync();
    }
    tree.Sync();
    }
    int64_t end = GetStopwatch()/1000;
    printf("Delay accuracy, got: %lld, expected %lld\n", (long long int) (end-start), (long long int) delayTime*visibleLen );

    tree.SetNLed(0,NUMPIXELS, 0x0, 30, 0x0);
    tree.ShowLeds();
    tree.DelayUntil((visibleLen+200)*delayTime);
    tree.Sync();
    end = GetStopwatch()/1000;
    printf("DelayUntil accuracy, got: %lld, expected %lld\n", (long long int) (end-start), (long long int) delayTime*(visibleLen+200) );

    printf("Check CPU use drift\n");
    const int delayTime2 = 3000;
    const int loopAmt = 25;
    start = GetStopwatch()/1000;
    for (int k=0,j=0;k<loopAmt;k++)
    {
        for (int i=0;i<NUMPIXELS/visibleLen;i++,j++)
        {
            for (int r=0;r<visibleLen; r++)
            {
                tree.SetLed(r+(i*visibleLen), (j*5)&0x3f, (j*3)&0x3f, (j*7)&0x3f);
            }
            tree.ShowLeds();
            tree.Delay(delayTime2);
            //tree.SetLed(i, 0, 0, 0);
            j++;
        }
        tree.Sync();
    }
    end = GetStopwatch()/1000;
    printf("Drift accuracy, got: %lld, expected %lld\n", (long long int) (end-start), (long long int) delayTime2*loopAmt*NUMPIXELS );
}

void progress(LedCtrl& tree)
{
    const int NPX = 150;
    printf("progress\n");
    int j=0;
    while(j < 10)
    {
        // printf("sleep %dms\n", 100-j); 
        for (int i=0;i<NPX;i++)
        {
            tree.SetLed(i,(j+i+2)&0x3f,(j+i+4)&0x3f,(j+i+8)&0x3f);
            tree.ShowLeds();
            tree.Delay(10000);
            tree.SetLed(i,0,0,0);
            //usleep((100-j)*1000);
        }
        printf("sync\n");
        tree.Sync();
        j++;
    }
}

void progress2(LedCtrl& tree)
{
    const int NPX = 150;
    printf("progress2\n");
    const int tailLen=50;
    int j=0;
    while(j < 10)
    {
        for (int i=0;i<NPX;i++)
        {
            tree.SetLed(i,(j+i+2)&0x3f,(j+i+4)&0x3f,(j+i+8)&0x3f);
            tree.ShowLeds();
            //tree.Delay(10000);
            if (i >= 10) tree.SetLed(i-tailLen,0,0,0);
            //usleep((100-j)*1000);
        }
        tree.Sync();
        j++;
    }
}

void fader(LedCtrl& tree, unsigned int sec)
{
    sec*=1000;
    printf("fader\n");
    int j=0;
    int red=0,grn=10,blu=20;
    int radd=1, gadd=2, badd=3;
    int max = 255;

    uint64_t start = GetStopwatch()/(1000*1000);
    while ((GetStopwatch()/(1000*1000)) - start < sec)
    {
        red += radd;
        grn += gadd;
        blu += badd;
        if (red < 0) { red=0; radd = 1+(rand()%3); }
        if (grn < 0) { grn=0; gadd = 1+(rand()%3); }
        if (blu < 0) { blu=0; badd = 1+(rand()%3); }
        if (red > max) { red=max; radd = -(rand()%3) - 1; }
        if (grn > max) { grn=max; gadd = -(rand()%3) - 1; }
        if (blu > max) { blu=max; badd = -(rand()%3) - 1; }

        tree.SetNLed(0, NUMLEDS, red, grn, blu, true);
        j++;
        tree.ShowLeds();
        tree.Delay(1000);
        //if ((j&63)==0)
        tree.Sync();
        j++;
    }
}


// A good test to see slow wifi
void testsparkle(LedCtrl& tree)
{
    tree.FadeNLed(0,900,200,0,0,0);
    //tree.updateLights();
    tree.SyncDelay(1000);

    for(int j=0;j<5000;j++)
    {
        int i = j%50;
        tree.SetLed(i, 0, 150, 160);
        //tree.updateLights();
        tree.SyncDelay(1000);
        tree.SetLed(i, 0, 0, 20);
    }
}


int xmas2021(LedCtrl& tree, unsigned int time)
{
    time_t start = std::time(NULL);
    time_t end = start + time;

    printf("xmas2021 begin\n");

    while ((unsigned int)std::time(NULL) < end)
    {
        if (!MarqueeRotate(tree,time)) break;
        if (!CheckLeds(tree, time)) break;
        if (std::time(NULL) > end) break;
        if (!Marquee(tree,time)) break;
        if (std::time(NULL) > end) break;
          //if (!IndividualGreenRedFade(tree, 10*time)) break;
          //test(tree);
        //fader(tree, 60);
          //tree.disconnect();
          //progress2(tree);
          //progress(tree);
        if (!AllManyColors(tree, time, 0, 0x0000ff00)) break;
        if (std::time(NULL) > end) break;
          //if (!AllManyColors(tree, 30, 5, 0x0000ff00)) break;
        if (!GreenRedFade(tree, time)) break;
        if (std::time(NULL) > end) break;
        if (!YellowPurpleBy2(tree,time)) break;
        if (std::time(NULL) > end) break;
        if (!GreenRedAlternate(tree,time)) break;
        if (std::time(NULL) > end) break;
        // if (!Travel(tree, time)) break;
        if (!IndividualGreenRedFade(tree, time)) break;
        if (std::time(NULL) > end) break;
        if (!GreenRedFade(tree, time)) break;
    }
    printf("xmas2021 end\n");
    return 0;
}

