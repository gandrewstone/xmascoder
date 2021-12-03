#include <FastLED.h>
#include "fadeController.h"

void faderTest()
{
  Debug.print(DBG_INFO, "Fader Test");
  if (fader == nullptr) return;
  CRGB col = CRGB(255,0,0);
  int fadeLength=100;

  
  for (int i=0;i<NumLeds;i++)
  {
    fader->fade(i, fadeLength, col);
  }

  for (int i=0;i<fadeLength; i++)
  {
    fader->loop();
    if (FLon) FastLED.show();
    delayMicroseconds(1000);
  }

  col = CRGB(0,255,0);
  fadeLength *= 2;
  
  for (int i=0;i<NumLeds;i++)
  {
    fader->fade(i, fadeLength, col);
  }

  Debug.print(DBG_INFO, "Fade to Green with yanking");
  for (int i=0;i<fadeLength; i++)
  {
    fader->loop();
    fader->yank((i*2)%NumLeds, CRGB(255,0,255));
    if (FLon) FastLED.show();
    delayMicroseconds(1000);
  }

  col = CRGB(0,0,255);
  //fadeLength /= 2;
  
  for (int i=0;i<NumLeds;i++)
  {
    fader->fade(i, fadeLength, col);
  }

  Debug.print(DBG_INFO, "Fade to Blue but redirect every other to green-blue");
  for (int i=0;i<fadeLength; i++)
  {
    fader->loop();
    fader->redirect((1+(i*2))%NumLeds, CRGB(0,40,60));
    if (FLon) FastLED.show();
    delayMicroseconds(1000);
  }

  
}



void colorBounce()
{
    Debug.print(DBG_INFO, "Color bounce");
    int j=0;
    int red=0x20,grn=10,blu=20;
    int radd=1+(rand()%5), gadd=2+(rand()%15), badd=3+(rand()%7);
    int maxx = 0x70;
    while(j < 50)
    {
        red += radd;
        grn += gadd;
        blu += badd;
        if (red < 0) { red=0; radd = 1+(rand()%5); }
        if (grn < 0) { grn=0; gadd = 1+(rand()%6); }
        if (blu < 0) { blu=0; badd = 1+(rand()%7); }
        if (red > maxx) { red=maxx; radd = -(rand()%8) - 1; }
        if (grn > maxx) { grn=maxx; gadd = -(rand()%7) - 1; }
        if (blu > maxx) { blu=maxx; badd = -(rand()%6) - 1; }

        // Always setting the lowest bit causes any insertion into the bitstream to shift a 1 into the highest brightness of the next color, causing a flash
        auto col = CRGB(red|1,grn|1,blu|1);

        // hide the flash effect
        //auto col = CRGB(red&0xfe,grn&0xfe,blu&0xfe);

        //auto col = CRGB(0,0,1);
        //if (j&1 == 1) col = CRGB(0,1,0);
        for (int i=0;i<NumLeds;i++)
            leds[i] = col;
        if (FLon) FastLED.show(); 
        delayMicroseconds(10000);
        j++;
    }
}


unsigned int qtPos = 0;
void quickTest()
{
  int r=0;
  int g=0;
  int b=0;
  Serial.println("Quick Test");
  for (int32_t j=0;j<20;j++)
  {
    for (int32_t i=0;i<100;i++)
    {
        //leds[(i+j)%NumLeds] = CRGB(r,g,b);
        //if ((i+j)&1U==0U) leds[i] = CRGB(0x00,0x80,0x20);
        //else leds[i] = CRGB(0x40,0x00,0x80);
        
        if ((qtPos&7)==0) leds[i] = CRGB(0x00,0x40,0x10);
        else if ((qtPos&7)==1) leds[i] = CRGB(0x00,0x00,0xff);
        else if ((qtPos&7)==2) leds[i] = CRGB(0x00,0x00,0x60);
        else if ((qtPos&7)==3) leds[i] = CRGB(0x00,0x40,0x90);
        else leds[i] = CRGB(0x0,0x0,0x00);
        
        //leds[i] = CRGB(0x0,0x0,0x01);
        qtPos++;
        //tree.Delay(delayTime);
        //r+=3;
        //g+=5;
        //b+=7;
        //if (r>255) r=0;
        //if (g>255) g=0;
        //if (b>255) b=0;
    }
    qtPos++;  // move them along the strand by changing qtPos relative to the start of the loop
    if (FLon) FastLED.show();
    delayMicroseconds(200000);
    Serial.print("-");
    if ((qtPos&127) == 0) Serial.print("\n");
  }   
}
