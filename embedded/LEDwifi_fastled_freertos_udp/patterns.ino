#include <FastLED.h>
#include "fadeController.h"

extern int dimmer;

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

#define C(a,b,c) CRGB((a)/dimmer,(b)/dimmer,(c)/dimmer)

CRGB myCols[19]; 
int numCols = 19;

void setStandardCols()
{
  myCols[0] = C(255,0,0);
  myCols[1] = C(255,128,0);
  myCols[2] = C(128,255,0);
  myCols[3] = C(0,255,0); 
  myCols[4] = C(255,0,128); 
  myCols[5] = C(128,0,255); 
  myCols[6] = C(128,64,0); 
  myCols[7] = C(0, 128,64);
  myCols[8] =  C(64, 0, 128); 
  myCols[9] =  C(64, 128, 64);
  myCols[10] = C(128, 64, 64);
  myCols[11] = C(64, 64, 128); 
  myCols[12] = C(255, 255, 0); 
  myCols[13] = C(0,0, 32); 
  myCols[14] = C(0, 255, 255);
  myCols[15] = C(32,0, 0);
  myCols[16] = C(255, 0, 255); 
  myCols[17] = C(0, 32, 0);
  myCols[18] = C(0,0,0);
  numCols = 18;
}

void setXmasCols()
{
  myCols[0] = C(255,0,0);
  myCols[1] = C(0,255,0);
  myCols[2] = C(255,255,0);
  myCols[3] = C(255,255,255);
  
  myCols[4] = C(64,0,0);
  myCols[5] = C(0,64,0);
  myCols[6] = C(64,64,0);
  myCols[7] = C(64,64,64);
  myCols[8] = C(0,0,0);
  numCols = 8;
}

#undef C

void gentleAlternateFade(uint64_t now)
{
  int c=-1;
  static uint64_t pauseMicros = 0;
  if (!fader) return;
  size_t fadeLength = 2000;
  size_t pauseLength = 10000;

  //Debug.print(DBG_INFO, "Binary mode packet done connected=%d", client.connected());
  if (pauseMicros > now) return;  // pop out to check for incoming script
  size_t delayTime = (fadeLength + pauseLength*1000);
  pauseMicros = now + delayTime;
  c = (now / delayTime) % numCols;

  // should never happen if numCols is set properly
  if (myCols[c][0] == 0 && myCols[c][1] == 0 && myCols[c][2] == 0)
  {
    c = 0;
  }
  
  for (int i=0;i<NumLeds; i+=2)
    {
      fader->fade(i, fadeLength/10, myCols[c]);
      if (i+1 < NumLeds) fader->fade(i+1, fadeLength/10, myCols[c+1]);
      
    } 
}

void colHold(uint64_t now, bool sparkle = true)
{
  static uint64_t pauseMicros = 0;
  const int NumSparkles = NumLeds/40;
  if (!fader) return;
  size_t fadeLength = 1000;
  size_t pauseLength = 5000;
  size_t delayTime = (fadeLength + pauseLength*1000);

  //Debug.print(DBG_INFO, "Binary mode packet done connected=%d", client.connected());
  if (pauseMicros > now)  // pop out to check for incoming script
  {
    // but add some sparkles first
    if (sparkle)
    {
      CRGB yellow = CRGB(255, 200, 0);
      CRGB saveSparkle[NumSparkles];
      int saveSparkleIndex[NumSparkles];
    
    // Lock lock(faderMutex);
      for (int i=0; i<NumSparkles; i++)
      {
      int idx = random(0,NumLeds);
      saveSparkle[i] = leds[idx];
      saveSparkleIndex[i] = idx;
      leds[idx] = yellow;
      // fader->set(random(0,NumLeds), yellow);
      }
      FastLED.show();
      delay(10);
      for (int i=0; i<NumSparkles; i++)
      {
        leds[saveSparkleIndex[i]] = saveSparkle[i];
      }       
    }
    return;  
  }

  pauseMicros = now + delayTime;
  int c = (now / delayTime) % numCols;
  
  for (int i=0;i<NumLeds; i++)
  {
      fader->fade(i, fadeLength/10, myCols[c]);
  } 
}

void slowTrails(uint64_t now)
{
  int c=-1;
  int chainPos = 0;
  static uint64_t pauseMicros = 0;
  static int trailLen = 16;
  if (!fader) return;
  size_t fadeLength = 30;
  size_t pauseLength = 15000;
  size_t delayTime = (fadeLength + pauseLength*10);

  //Debug.print(DBG_INFO, "Binary mode packet done connected=%d", client.connected());
  if (pauseMicros > now) return;  // pop out to check for incoming script
  pauseMicros = now + delayTime; 
 
  chainPos = now/delayTime % 100;
  c = (now / (delayTime*100)) % numCols;

  /*
  if ((chainPos % 20) == 19)
  {
    if (trailLen<12) trailLen = 64;
    else trailLen -=1 ;
  }
  */
  
  for (int i=0;i<NumLeds; i+=trailLen)
    {
      for (int j=0;j<trailLen;j++)
      {
          int loc = (i + j + chainPos) % NumLeds;
          auto col = CRGB(0,0,0);
          if (j < 12) col = myCols[c]/(12-j);
          fader->fade(loc, fadeLength, col);
      }
      
    }
}

void multiColTrails(uint64_t now)
{
  int c=-1;
  int chainPos = 0;
  static uint64_t pauseMicros = 0;
  static int trailLen = 16;
  if (!fader) return;
  size_t fadeLength = 30;
  size_t pauseLength = 15000;
  size_t delayTime = (fadeLength + pauseLength*10);

  //Debug.print(DBG_INFO, "Binary mode packet done connected=%d", client.connected());
  if (pauseMicros > now) return;  // pop out to check for incoming script
  pauseMicros = now + delayTime;
  //chainPos++;
  chainPos = now/delayTime % 100;
  // if ((chainPos % 100) == 99) c++;
  c = (now / (delayTime*100)) % numCols;
  /*
  if ((chainPos % 20) == 19)
  {
    if (trailLen<12) trailLen = 64;
    else trailLen -=1 ;
  }
  */

  //if (myCols[c][0] == 0 && myCols[c][1] == 0 && myCols[c][2] == 0)
  //{
  //  c = 0;
  //}
  
  int nowCol = c;
  for (int i=0;i<NumLeds; i+=trailLen)
    {
      for (int j=0;j<trailLen;j++)
      {
          int loc = (i + j + chainPos) % NumLeds;
          auto col = CRGB(0,0,0);
          if (j < 12) col = myCols[nowCol]/(12-j);
          fader->fade(loc, fadeLength, col);
      }
      nowCol++;
      if (myCols[nowCol][0] == 0 && myCols[nowCol][1] == 0 && myCols[nowCol][2] == 0)
      {
          nowCol = 0;
      } 
    }
}

void multiColMarquee(uint64_t now, int slowFactor = 10)
{
  int c=-1;
  int chainPos = 0;
  static uint64_t pauseMicros = 0;
  static int trailLen = 16;
  if (!fader) return;
  size_t fadeLength = 30;
  size_t pauseLength = 5000;
  size_t delayTime = (fadeLength + pauseLength*slowFactor);

  //Debug.print(DBG_INFO, "Binary mode packet done connected=%d", client.connected());
  if (pauseMicros > now) return;  // pop out to check for incoming script
  pauseMicros = now + delayTime;

  chainPos = now/delayTime % 100;
  c = (now / (delayTime*100)) % numCols;

  /*
  if ((chainPos % 20) == 19)
  {
    if (trailLen<12) trailLen = 64;
    else trailLen -=1 ;
  }
  */

  if (myCols[c][0] == 0 && myCols[c][1] == 0 && myCols[c][2] == 0)
  {
    c = 0;
  }
  
  int nowCol = c;
  for (int i=0;i<NumLeds; i+=trailLen)
    {
      for (int j=0;j<trailLen;j++)
      {
          int loc = (i + j + chainPos) % NumLeds;
          auto col = CRGB(0,0,0);
          if (j < 12) col = myCols[nowCol]/(12-j);
          if (slowFactor > 50)  // if they want to go slow be smooth as well
          {
            fader->fade(loc,fadeLength, col);
          }
          else fader->set(loc, col);
          nowCol++;
          if (myCols[nowCol][0] == 0 && myCols[nowCol][1] == 0 && myCols[nowCol][2] == 0)
          {
              nowCol = 0;
          } 
      }
    }
}

void insideDefault()
{
  int64_t now = micros64();
  now = now/1000000;  // convert to seconds
  now = now/300;  // convert to 5 minute periods
  switch(now % 5)
  {
    case 0:
        gentleAlternateFade(now);
        break;
    case 1:
        multiColTrails(now);
        break;
    case 2:
        multiColMarquee(now, 100);
        break;
    case 3:
        colHold(now, false);
        break;
    case 4:
        slowTrails(now);
        break;
    default:
        gentleAlternateFade(now);
        break;
  }
}


void outsideDefault()
{
  int64_t now = micros64();
  int64_t pattern = now/1000000;  // convert to seconds
  pattern = pattern/60;  // convert to minutes
  switch(pattern % 5)
  {
    case 0:
        multiColTrails(now);
        break;
    case 1:
        gentleAlternateFade(now);
        break;
    case 2:
        multiColMarquee(now);
        break;
    case 3:
        colHold(now);
        break;
    case 4:
        slowTrails(now);
        break;
    default:
        gentleAlternateFade(now);
        break;
  }
}

template<typename Num> void swap(Num& a, Num& b)
{
  Num c = a;
  a = b;
  b = c;
}

class LightSection
{
  public:
  int start;
  int end;
  int stride;
  int count;

  LightSection(int s, int e, int d = 1):start(s), end(e), stride(d)
  {
    if (stride == 0) stride = 1;
    if ((stride > 0)&&(start > end)) swap(start, end);
    if ((stride < 0)&&(start < end)) swap(start, end);
    count = (end-start)/stride;
  }

  void fade(int transitionDuration, int16_t red, int16_t green, int16_t  blue)
  {
    
    for(int i = start, j=0; j<count; i+=stride,j++)
        fader->fade(i,transitionDuration, red, green, blue);
  }
  
  void fade(int transitionDuration, const CRGB& color)
  {
    fade(transitionDuration, color[0], color[1], color[2]);
  }

  template<typename Lambda>
  void forEach(Lambda&& doit)
  {
    for (int i = start, j=0; j<count; i+=stride,j++)
    {
      if (!doit(i)) return;
    }
  }

};

CRGB cleanCols[] = { CRGB(255,255,255), CRGB(255,0,0), CRGB(0, 255,0), CRGB(0,0,255), CRGB(255,255,0), CRGB(0,255,255), CRGB(255, 0,255), 
 CRGB(128,255,0), CRGB(0,128,255), CRGB(128, 0,255),  CRGB(255,128,0), CRGB(0,255,128), CRGB(255, 0, 128), CRGB(0,0,0) };


CRGB signCols[] = { 
  CRGB(64,0,0), CRGB(128,0,0), CRGB(255,80,0),  
  CRGB(64,64,0), CRGB(128,128,0), CRGB(255,200,60),  
  CRGB(0,64,0), CRGB(0,128,0), CRGB(128,255,10),  
  CRGB(64,0,100), CRGB(128,0,180), CRGB(255,40,255),  
  CRGB(0,64,100), CRGB(0,128,180), CRGB(40,255,255),  
  CRGB(0,0,0)
};

void signZing()
{
  static LightSection signC(0,13);
  static LightSection hristmasCoder(13,40);
  static LightSection signTop(63,43,-1);
  static int ctrlLightsStart = 44, ctrlLightsEnd = 81;
  static int signBulb = 17;

  for (int i=0; i<NumLeds; i++)
  {
    fader->set(i,CRGB(0,0,0));
  }

  
  for (int col=0;!((signCols[col][0]==0)&&(signCols[col][1]==0)&&(signCols[col][2]==0));col+=3)
  {
    signTop.fade(3000/10, signCols[col]);
    hristmasCoder.fade(2000/10, signCols[col+1]);
    signC.fade(1000/10, signCols[col+2]);
    delay(2000);

    signC.forEach([](int i) -> bool { 
      auto tmp = fader->get(i);
      fader->yank(i, CRGB(200,200,0)); 
      delay(20); 
      fader->yank(i, tmp);
      return true; 
      });
    signTop.forEach([](int i) -> bool { 
      auto tmp = fader->get(i);
      fader->yank(i, CRGB(200,200,0)); 
      delay(20); 
      fader->yank(i, tmp);
      return true; 
      });
    
    for (int bulbCol = 0; !((cleanCols[bulbCol][0]==0)&&(cleanCols[bulbCol][1]==0)&&(cleanCols[bulbCol][2]==0)); bulbCol++)
    {
      fader->set(signBulb,cleanCols[bulbCol]);
      delay(600);
    }
  }
}

void randomTwinkle()
{
  if (!fader) return;
  size_t fadeLength = 100;

  for (int i=0;i<NumLeds; i++)
  {
      fader->fade(i, fadeLength, CRGB(random(0,255),random(0,255),random(0,255)));
      //fader->fade(i, fadeLength, CRGB( ((i&3)==0) ? random(10,255) : 0,((i&3)==1) ? random(10,255):0,((i&3)==2) ? random(10,255):0));
      //fader->fade(i, fadeLength, CRGB( (((i&7)==0) ? 255 : 0),(((i&7)==1) ? 255:0),(((i&7)==2) ? 255:0) ));
      //fader->set(i, CRGB( (((i&7)==0) ? 255 : 0),(((i&7)==1) ? 255:0),(((i&7)==2) ? 255:0) ));
  } 
  vTaskDelay((fadeLength*10) / portTICK_PERIOD_MS);
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
