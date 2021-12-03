#include "fadeController.h"
#include <Arduino_DebugUtils.h>

FadeController::FadeController(CRGB* _leds, int _numLeds, void (*doneCallback)(FadeController& me, int led)):
    numLeds(_numLeds), mLeds(_leds)
{
    doneCall = doneCallback;
}

void FadeController::init()
{
    change = new int16_t [numLeds * NUM_FADE_COLOR_CHANNELS];
    Debug.print(DBG_INFO, "2");
    count  = new int16_t [numLeds * NUM_FADE_COLOR_CHANNELS];
    Debug.print(DBG_INFO, "3");
    destination = new uint8_t [numLeds * NUM_FADE_COLOR_CHANNELS];
    Debug.print(DBG_INFO, "4");
    bresenham = new int16_t[numLeds * NUM_FADE_COLOR_CHANNELS];
    Debug.print(DBG_INFO, "5");
    for (int i=0;i<numLeds * NUM_FADE_COLOR_CHANNELS;i++)
    {
      change[i] = 0;
      count[i]  = 0;  // turns it off
      destination[i] = 0;
      bresenham[i] = 0;
    }
}

void FadeController::fade(int led,  int transitionDuration, int16_t red, int16_t green, int16_t  blue)
{
  if (led<numLeds)
  {
    if (transitionDuration<1) transitionDuration=1;  // Fix up impossible values
    int idx = led * NUM_FADE_COLOR_CHANNELS;
    count[idx+0] = transitionDuration;
    count[idx+1] = transitionDuration;
    count[idx+2] = transitionDuration;

    destination[idx+0] = red;
    destination[idx+1] = green;
    destination[idx+2] = blue;

    CRGB curcol = mLeds[led];
    change[idx+0] = ((int16_t) red) - ((int16_t) curcol.red);
    change[idx+1] = ((int16_t) green) - ((int16_t) curcol.green);
    change[idx+2] = ((int16_t) blue) - ((int16_t) curcol.blue);
  }
}

void FadeController::redirect(int led, int16_t red, int16_t green, int16_t  blue)
{
  if (led<numLeds)
  {
    int idx = led * NUM_FADE_COLOR_CHANNELS;

    destination[idx+0] = red;
    destination[idx+1] = green;
    destination[idx+2] = blue;

    CRGB curcol = mLeds[led];
    change[idx+0] = ((int16_t) red) - ((int16_t) curcol.red);
    change[idx+1] = ((int16_t) green) - ((int16_t) curcol.green);
    change[idx+2] = ((int16_t) blue) - ((int16_t) curcol.blue);
  }
}

void FadeController::yank(int led, int16_t red, int16_t green, int16_t  blue)
{
  if (led<numLeds)
  {
    int idx = led * NUM_FADE_COLOR_CHANNELS;

    CRGB curcol = CRGB(red,green,blue);
    mLeds[led] = curcol;
    change[idx+0] = ((int16_t) destination[idx+0]) - ((int16_t) curcol.red);
    change[idx+1] = ((int16_t) destination[idx+1]) - ((int16_t) curcol.green);
    change[idx+2] = ((int16_t) destination[idx+2]) - ((int16_t) curcol.blue);
  }
}

void FadeController::set(int led, const CRGB &color)
{
  if (led<numLeds)
  {
    int idx = led * NUM_FADE_COLOR_CHANNELS;

    mLeds[led] = color;
    destination[idx+0] = color.red;
    destination[idx+1] = color.green;
    destination[idx+2] = color.blue;
    change[idx+0] = 0;
    change[idx+1] = 0;
    change[idx+2] = 0;
  }
}


void FadeController::fade(int led,  int transitionDuration, const CRGB& color)
{
    fade(led, transitionDuration, color.red, color.green, color.blue);
}


void FadeController::loop(void)
{
    register int j;
    for (j=0;j<numLeds;j++)
    {
        int idx = j * NUM_FADE_COLOR_CHANNELS;
        if (count[idx] <= 0) continue;  // LED is paused
        bool changed = false;

        CRGB curcol = mLeds[j];
        // if (j==0) Debug.print(DBG_INFO, "ST %d, %d, %d", curcol.red, curcol.green, curcol.blue);
        //if (j==0) Debug.print(DBG_INFO, "DST %d, %d, %d", destination[idx], destination[idx+1], destination[idx+2]);
        register int c = curcol.red;
        if (destination[idx] != c) // This led is changing
        {
            bresenham[idx] += change[idx];
            /* Note that if change could be > count then this should be a while loop */
            while ((bresenham[idx]<0)&& (c != destination[idx]))
            {
                bresenham[idx]+=count[idx];
                c--;
                //if (j==0) Debug.print(DBG_INFO, "-RED");
            }
            while ((bresenham[idx]>=count[idx])&& (c != destination[idx]))
            {
                bresenham[idx]-=count[idx];
                c++;
                //if (j==0) Debug.print(DBG_INFO, "+RED");
            }
            curcol.red = c;
            changed=true;
        }

        idx++;
        c = curcol.green;
        if (destination[idx] != c) // This led is changing
        {
            bresenham[idx] += change[idx];
            /* Note that if change could be > count then this should be a while loop */
            while ((bresenham[idx]<0)&& (c != destination[idx]))
            { bresenham[idx]+=count[idx]; c--;}
            while ((bresenham[idx]>=count[idx])&& (c != destination[idx])) { bresenham[idx]-=count[idx]; c++;}

            curcol.green = c;
            changed=true;
        }

        idx++;
        c = curcol.blue;
        if (destination[idx] != curcol.blue) // This led is changing
        {
            bresenham[idx] += change[idx];
            /* Note that if change could be > count then this should be a while loop */
            while ((bresenham[idx]<0)&& (c != destination[idx]))
            { bresenham[idx]+=count[idx]; c--;}
            while ((bresenham[idx]>=count[idx])&& (c != destination[idx])) { bresenham[idx]-=count[idx]; c++;}
            curcol.blue = c;
            changed=true;
        }

        if (changed)
        {
            //if (j==0) Debug.print(DBG_INFO, "FC ch %d, %d, %d", curcol.red, curcol.green, curcol.blue);
            mLeds[j] = curcol;
            if (doneCall)
            {
                bresenham[idx-2]=0;
                bresenham[idx-1]=0;
                bresenham[idx]=0;
                (*doneCall)(*this,j);
            }
        }
    }
}
