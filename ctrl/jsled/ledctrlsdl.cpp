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

#include <SDL2/SDL.h>
//Screen dimension constants
const int SCREEN_WIDTH = 1024;
const int SCREEN_HEIGHT = 480;
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
  MAX_SET_PIXELS_COUNT = 20,
  CMD_SHOW = 8,
};

SDL_Window* window = NULL; //The surface contained by the window
SDL_Surface* screenSurface = NULL;
SDL_Renderer* gRenderer = NULL;

LedCtrl::LedCtrl(unsigned int numLeds)
{
    // Initialize SDL
    if (SDL_Init(SDL_INIT_VIDEO) < 0)
    {
        printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        exit(-1);
    }
    else
    { // Create window
        window = SDL_CreateWindow("LED colors", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH,
            SCREEN_HEIGHT, SDL_WINDOW_SHOWN);
        if (window == NULL)
        {
            printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
            exit(-1);
        }
        else
        { // Get window surface
            //screenSurface = SDL_GetWindowSurface(window); // Fill the surface white
            //SDL_FillRect(screenSurface, NULL,
            //    SDL_MapRGB(screenSurface->format, 0xFF, 0xFF,
            //                 0xFF)); // Update the surface
            //SDL_UpdateWindowSurface(window);

            gRenderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
            if (gRenderer == NULL)
            {
                printf("Renderer could not be created! SDL Error: %s\n", SDL_GetError());
                exit(-1);
            }
            SDL_SetRenderDrawColor( gRenderer, 0xFF, 0xFF, 0xFF, 0xFF );
            SDL_RenderClear( gRenderer );
            SDL_RenderPresent( gRenderer );
            SDL_RenderClear( gRenderer );
        }
    }
}

LedCtrl::~LedCtrl()
{
    SDL_DestroyWindow( window );
    SDL_Quit();
}

void LedCtrl::SetLed(unsigned int i, unsigned char r, unsigned char g, unsigned char b)
{
    const unsigned int LEDSPERROW=50;
    const unsigned int LEDSZ=20;
    SDL_Rect fillRect = {(int) ((i%LEDSPERROW)*LEDSZ),(int)( (i/LEDSPERROW)*LEDSZ), LEDSZ, LEDSZ};
    SDL_SetRenderDrawColor(gRenderer, r, g, b, 0xFF);
    SDL_RenderFillRect(gRenderer, &fillRect);
}
void LedCtrl::SetNLed(unsigned int i, unsigned int count, unsigned char r, unsigned char g, unsigned char b)
{
    for (unsigned int j=0;j<count;j++) SetLed(i+j,r,g,b);
}
void LedCtrl::SetLeds(unsigned int pxIdx, unsigned int count, uint32_t *buf)
{
    for (unsigned int j=0,k=0;j<count;j++,k++) SetLed(pxIdx+j,buf[k]>>16, (buf[k]>>8)&255, buf[k]&255);
}

bool LedCtrl::ShowLeds()
{
    SDL_Event e;
    SDL_RenderPresent(gRenderer);
    SDL_RenderClear( gRenderer );
    while (SDL_PollEvent(&e) != 0)
    {
        // User requests quit
        if (e.type == SDL_QUIT)
        {
            return false;
        }
    }
    return true;
}
