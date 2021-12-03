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
    rotateBuf = new uint8_t[numLeds * NUM_FADE_COLOR_CHANNELS * sizeof(int16_t)];
    
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
    count[idx+0] = 0;
    count[idx+1] = 0;
    count[idx+2] = 0;

  }
}

//uint8_t rBuf[2000*sizeof(uint16_t)*3];
//void* rotateBuf = &rBuf;

void FadeController::rotate(int start, int ledCount, int jump)
{
  const size_t NumColorChannels = 3;
  // Clean up weird values
  jump = jump%ledCount;
  if (jump == 0) return;
  
  if (start+ledCount > numLeds)
    ledCount = numLeds - start;
  if (ledCount < 0) return;  // also catches start > numLeds

  // TODO be more efficient
  //void* rotateBuf = new uint8_t[ledCount*sizeof(uint16_t)*NumColorChannels];
  if (rotateBuf == nullptr) return;  // sorry can't do it.

  // move colors
  memcpy(rotateBuf, (uint8_t*) &mLeds[start], ledCount*sizeof(CRGB));
  if (jump >= 0)
  {
    memcpy((uint8_t*) &mLeds[start+jump], rotateBuf, (ledCount-jump)*sizeof(CRGB));
    memcpy((uint8_t*) &mLeds[start], rotateBuf+((ledCount-jump)*sizeof(CRGB)), jump*sizeof(CRGB));
  }
  else
  {
    memcpy((uint8_t*) &mLeds[start], rotateBuf-(jump*sizeof(CRGB)), (ledCount+jump)*sizeof(CRGB));  // remember jump is neg so signs reversed
    memcpy((uint8_t*) &mLeds[start+ledCount+jump], rotateBuf, -jump*sizeof(CRGB));  // remember jump is neg so signs reversed   
  }

  // Now we are moving by 3 channels per led so:
  jump*=NumColorChannels;
  ledCount*=NumColorChannels;
  start*=NumColorChannels;

  // move destination
  size_t tot  = ledCount*sizeof(uint8_t);
  size_t cutR = (ledCount-jump)*sizeof(uint8_t);
  size_t cutL = jump*sizeof(uint8_t);
  
  memcpy(rotateBuf, (uint8_t*) &destination[start], tot);
  if (jump >= 0)
  {
    memcpy((uint8_t*) &destination[start+jump], rotateBuf, cutR);
    memcpy((uint8_t*) &destination[start], rotateBuf+cutR, cutL);
  }
  else
  {
    memcpy((uint8_t*) &destination[start], rotateBuf-cutL, cutR);  // remember jump is neg so signs reversed
    memcpy((uint8_t*) &destination[start+ledCount+jump], rotateBuf, -cutL);  // remember jump is neg so signs reversed
  }

  // The rest of the fields are uint16_t not uint8_t
  tot  *= 2;
  cutR *= 2;
  cutL *= 2;

  // move change  
  memcpy(rotateBuf, (uint8_t*) &change[start], tot);
  if (jump >= 0)
  {
    memcpy((uint8_t*) &change[start+jump], rotateBuf, cutR);
    memcpy((uint8_t*) &change[start], rotateBuf+cutR, cutL);
  }
  else
  {
    memcpy((uint8_t*) &change[start], rotateBuf-cutL, cutR);  // remember jump is neg so signs reversed
    memcpy((uint8_t*) &change[start+ledCount+jump], rotateBuf, -cutL);  // remember jump is neg so signs reversed
  }

  // move count 
  memcpy(rotateBuf, (uint8_t*) &count[start], tot);
  if (jump >= 0)
  {
    memcpy((uint8_t*) &count[start+jump], rotateBuf, cutR);
    memcpy((uint8_t*) &count[start], rotateBuf+cutR, cutL);
  }
  else
  {
    memcpy((uint8_t*) &count[start], rotateBuf-cutL, cutR);  // remember jump is neg so signs reversed
    memcpy((uint8_t*) &count[start+ledCount+jump], rotateBuf, -cutL);  // remember jump is neg so signs reversed
  }

  // move bresenham
  memcpy(rotateBuf, (uint8_t*) &bresenham[start], tot);
  if (jump >= 0)
  {
    memcpy((uint8_t*) &bresenham[start+jump], rotateBuf, cutR);
    memcpy((uint8_t*) &bresenham[start], rotateBuf+cutR, cutL);
  }
  else
  {
    memcpy((uint8_t*) &bresenham[start], rotateBuf-cutL, cutR);  // remember jump is neg so signs reversed
    memcpy((uint8_t*) &bresenham[start+ledCount+jump], rotateBuf, -cutL);  // remember jump is neg so signs reversed
  }
  
  //delete[] rotateBuf;
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
