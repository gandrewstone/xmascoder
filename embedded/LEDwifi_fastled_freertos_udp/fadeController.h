//? <class>The FadeController class modifies the brightness of the LEDs smoothly and linearly through a desired
// brightness range.
#ifndef FADE_CONTROLLER
#define FADE_CONTROLLER
#include <FastLED.h>
#define NUM_FADE_COLOR_CHANNELS 3  // red, green, blue

class FadeController
{
  public:
  //?<method> Pass the constructor a FadeController object and also a callback (optional).  When this class finished moving a LED
  // to the desired brightness, it will call the callback so you can program a new intensity target in.</method>
  FadeController(CRGB* _leds, int _numLeds, void (*doneCallback)(FadeController& me, int led)=0);

  //?<method> 2 phase initialization so mallocs can be later
  void init(void);

  
  /*?<method> Transition the light at index 'led' to intensity over count iterations</method> */
  void fade(int led,  int transitionDuration, int16_t red, int16_t green, int16_t  blue);
  void fade(int led,  int transitionDuration, const CRGB& color);

  /*?<method> Switch to a new color target, keeping the same transition end count</method> */
  void redirect(int led, int16_t red, int16_t green, int16_t  blue);
  void redirect(int led, const CRGB& color) { redirect(led, color.red, color.green, color.blue); }

  /*?<method> Change the color right now and fade from it to the original target, same transition end </method> */
  void yank(int led, int16_t red, int16_t green, int16_t  blue);
  void yank(int led, const CRGB& color) { yank(led, color.red, color.green, color.blue); }

  /*?<method> Change the color and the fade target right now </method> */
  void set(int led, const CRGB &color);
  CRGB get(int led) { if ((led < numLeds)&&(led>=0)) return mLeds[led]; else return CRGB(0,0,0); }

  /*?<method> Rotate: Rotate the bulb and the fade information (marquee effect)  </method> */
  void rotate(int start, int count, int jump);
 
  /*?<method> Stop fading this LED </method> */
  void pause(int led)
  {
      int idx = led * NUM_FADE_COLOR_CHANNELS;
      if (count[idx] > 0) count[idx] = -count[idx];
  }

  /*?<method> Resume fading this LED.  Note that a call to fade will also make it restart (the new fade). </method> */
  void resume(int led)
  {
      int idx = led * NUM_FADE_COLOR_CHANNELS;
      if (count[idx] < 0) count[idx] = -count[idx];
  }
      
  
  /*?<method> Without changing the target or time to get there, change the current color of this bulb </method> */
  //void detour(int led, uint16_t red, uint16_t green, uint16_t  blue);

    
  //?<method> Call loop periodically and rapidly to change the brightness.  This function calls FlickerBrightness.loop(), so
  // it is unnecessary for you to do so.</method>
  void loop(void);
 
  protected:
  int numLeds;
  CRGB* mLeds;
  int16_t* change = nullptr;
  int16_t*  count = nullptr;
  uint8_t* destination = nullptr;  
  int16_t*  bresenham = nullptr;
  uint8_t* rotateBuf = nullptr;  // TODO we could certainly save memory here
  void (*doneCall)(FadeController& me, int led);
};
//?</class>

#endif
