#include <Arduino_DebugUtils.h>
#include <EEPROM.h>
// didn't help: #define FASTLED_ALLOW_INTERRUPTS 0
// totally broken: #define FASTLED_INTERRUPT_RETRY_COUNT 1
#include <FastLED.h>
#include "fadeController.h"

#define WIFI 1

const char compileDate[] = __DATE__ " " __TIME__;
/*
 Andrew Stone 2021

 A simple web server that lets you blink an LED via the web.
 This sketch will print the IP address of your WiFi Shield (once connected)
 to the Serial monitor. From there, you can open that address in a web browser
 to turn on and off the LED on pin 5.

 If the IP address of your shield is yourAddress:
 http://yourAddress/H turns the LED on
 http://yourAddress/L turns it off

 This example is written for a network using WPA encryption. For
 WEP or WPA, change the Wifi.begin() call accordingly.

 Circuit:
 * WiFi shield attached
 * LED attached to pin 5

 created for arduino 25 Nov 2012
 by Tom Igoe

ported for sparkfun esp32 
31.01.2017 by Jan Hendrik Berlin

 
 Based on Modifications Copyright (c) 2017-2019 Martin F. Falatic
 Based on public domain code created 19 Nov 2016 by Chris Osborn <fozztexx@fozztexx.com> xttp://insentricity.com 
 */

 /* 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include <WiFi.h>
#include <ESPmDNS.h>
#define COUNT_OF(x) ((sizeof(x)/sizeof(0[x])) / ((size_t)(!(sizeof(x) % sizeof(0[x])))))

const int LedCtrlPort = 1225;
const int LedCtrlMaxClients = 2;
const String ssid     = "ChristmasCoder";
const String password = "";
// Change this to configure what the minimum signal strength you are willing to connect to is
const int MinRssi = -72;

const int OnboardLed = 2;
const int LevelShiftEnable = 32;

#pragma GCC diagnostic pop

const int MIN_CNXN_FILL_INTERVAL = 1000;
#define DEFAULT_NUM_STRANDS 3 // COUNT_OF(strands);
#define NUM_LEDS_PER_STRAND 300
//#define NUM_LEDS (DEFAULT_NUM_STRANDS * NUM_LEDS_PER_STRAND)
size_t NumLeds = 0;

WiFiServer server(LedCtrlPort, LedCtrlMaxClients);
WiFiClient clients[LedCtrlMaxClients];

// Define the array of leds
CRGB *leds = nullptr;
FadeController *fader = nullptr;

bool FLon = true;  // Turn off LED driving
int64_t lastDelay = 0; 

typedef struct
{
    unsigned int magic;
    unsigned int numStrands;
    unsigned int ledsPerStrand;
    char boardName[32];
} ConfigData;

ConfigData configData;

//**************************************************************************

//extern volatile uint64_t fastLEDlastFillDuration;
//extern volatile uint64_t fastLEDfillDuration;
//extern volatile uint32_t fastLEDnumFills;

void dumpSysInfo() 
{
  esp_chip_info_t sysinfo;
  esp_chip_info(&sysinfo);
  Serial.print("ESP32 Model: ");
  Serial.print((int)sysinfo.model);
  Serial.print("; Features: 0x");
  Serial.print((int)sysinfo.features, HEX);
  Serial.print("; Cores: ");
  Serial.print((int)sysinfo.cores);
  Serial.print("; Revision: r");
  Serial.println((int)sysinfo.revision);
}

void AdvertiseServices(const char *MyName)
{
  if (MDNS.begin(MyName))
  {
    Serial.println(F("mDNS responder started"));
    Serial.print(F("I am: "));
    Serial.println(MyName);
 
    // Add service to MDNS-SD
    MDNS.addService("xmascoder", "tcp", LedCtrlPort);
  }
  else
  {
    while (1) 
    {
      Serial.println(F("Error setting up MDNS responder"));
      delay(1000);
    }
  }
}

/*
void logWiFis()
{
    // Set WiFi to station mode and disconnect from an AP if it was previously connected
    WiFi.mode(WIFI_STA);
    WiFi.disconnect();
    delay(100);

    int n = WiFi.scanNetworks();
    Serial.println("scan done");
    if (n == 0) {
        Serial.println("no networks found");
    } else {
        Serial.print(n);
        Serial.println(" networks found");
        for (int i = 0; i < n; ++i) {
            // Print SSID and RSSI for each network found
            Serial.print(i + 1);
            Serial.print(": ");
            Serial.print(WiFi.SSID(i));
            Serial.print(" (");
            Serial.print(WiFi.RSSI(i));
            Serial.print(")");
            Serial.println((WiFi.encryptionType(i) == WIFI_AUTH_OPEN)?" ":"*");
            delay(10);
        }
    }
}
*/

// Prints what WiFis I can hear.  Returns the strongest open network, unless the preferred is available and above the minimum.
// DISCONNECTS from WIFI!!!
String AnalyzeWiFis(String preferred = String())
{
    // Set WiFi to station mode and disconnect from an AP if it was previously connected
    WiFi.mode(WIFI_STA);
    WiFi.disconnect();
    delay(100);

    int n = WiFi.scanNetworks();
    Serial.println("scan done");
    if (n == 0) 
    {
        Serial.println("no networks found");
    } 
    else 
    {
        Serial.print(n);
        Serial.println(" networks found");
        int preferredIdx = -1;
        int maxRssiIdx = -1;
        for (int i = 0; i < n; ++i) 
        {
            if (WiFi.SSID(i) == preferred) preferredIdx = i;
            // Find the strongest open network
            if (WiFi.encryptionType(i) == WIFI_AUTH_OPEN)
                if ((maxRssiIdx==-1) || (WiFi.RSSI(maxRssiIdx) < WiFi.RSSI(i)))
                    maxRssiIdx = i;
            // Print SSID and RSSI for each network found
            Serial.print(i);
            Serial.print(": ");
            Serial.print(WiFi.SSID(i));
            Serial.print(" (");
            Serial.print(WiFi.RSSI(i));
            Serial.print(")");
            Serial.println((WiFi.encryptionType(i) == WIFI_AUTH_OPEN)?" ":"*");
        }

        // If our preferred is available and strong enough, return it.
        if ((preferredIdx >= 0) && WiFi.RSSI(preferredIdx) >= MinRssi) return preferred;
        // Otherwise return the strongest open connection
        if (maxRssiIdx != -1)
            return WiFi.SSID(maxRssiIdx);
    }
    return String();
}

void WiFiConnector()
{
    if (WiFi.status() != WL_CONNECTED)
    {
        Serial.println(WiFi.status());
        Serial.print("I am ");
        Serial.println(configData.boardName);
        String connectTo = AnalyzeWiFis(String(ssid));
    
        if (connectTo != "")
        {
            if ((connectTo == ssid)&&(password != ""))  WiFi.begin(ssid.c_str(), password.c_str());
            else WiFi.begin(connectTo.c_str());
          
            Serial.print("Connecting to ");
            Serial.println(connectTo);
            size_t tries = 0;
            while ((WiFi.status() != WL_CONNECTED) && (tries < 100))
            {
                digitalWrite(OnboardLed,tries&1);  
                delay(100);
                Serial.print(".");
                if (tries&127 == 0) Serial.print("\n");
                tries++;    
            }

            if (WiFi.status() == WL_CONNECTED)
            {
                Serial.println("");
                Serial.println("WiFi connected.");
                Serial.println("IP address: ");
                Serial.println(WiFi.localIP());
                AdvertiseServices(BoardName());
                server.setNoDelay(true);
                server.begin();
            }
            else
                Serial.println("WiFi cannot connect");
        }
        else
        {
          Debug.print(DBG_INFO,"No WiFi candidates");
        }
    }
}


bool initStrands()
{
  NumLeds = configData.numStrands * configData.ledsPerStrand;
  Debug.print(DBG_INFO,"%d Strands, %d LEDs per strand, %d total", configData.numStrands, configData.ledsPerStrand, NumLeds);
  leds = new CRGB[NumLeds];

  if (FLon)
  {
    if (configData.numStrands > 0)
    {
      FastLED.addLeds<WS2811, 13, RGB>(leds, 0 * configData.ledsPerStrand, configData.ledsPerStrand);
      Debug.print(DBG_INFO,"Initialized strand 0 at pin 13 with %d LEDs", configData.ledsPerStrand);
    }
    if (configData.numStrands > 1)
    {  
      FastLED.addLeds<WS2811, 14, RGB>(leds, 1 * configData.ledsPerStrand, configData.ledsPerStrand);
      Debug.print(DBG_INFO,"Initialized strand 1 at pin 14 with %d LEDs", configData.ledsPerStrand);
    }
    if (configData.numStrands > 2)
    {  
      FastLED.addLeds<WS2811, 15, RGB>(leds, 2 * configData.ledsPerStrand, configData.ledsPerStrand);
      Debug.print(DBG_INFO,"Initialized strand 2 at pin 15 with %d LEDs", configData.ledsPerStrand);
    }
    if (configData.numStrands > 3)
    {  
      FastLED.addLeds<WS2811, 16, RGB>(leds, 3 * configData.ledsPerStrand, configData.ledsPerStrand);
      Debug.print(DBG_INFO,"Initialized strand 3 at pin 16 with %d LEDs", configData.ledsPerStrand);
    }
    if (configData.numStrands > 4)
    {    
      FastLED.addLeds<WS2811, 17, RGB>(leds, 4 * configData.ledsPerStrand, configData.ledsPerStrand);
      Debug.print(DBG_INFO,"Initialized strand 3 at pin 17 with %d LEDs", configData.ledsPerStrand);
    }
    if (configData.numStrands > 5)
    {  
      FastLED.addLeds<WS2811, 18, RGB>(leds, 5 * configData.ledsPerStrand, configData.ledsPerStrand);
      Debug.print(DBG_INFO,"Initialized strand 3 at pin 18 with %d LEDs", configData.ledsPerStrand);
    }
    if (configData.numStrands > 6)
    {  
      FastLED.addLeds<WS2811, 21, RGB>(leds, 6 * configData.ledsPerStrand, configData.ledsPerStrand);
      Debug.print(DBG_INFO,"Initialized strand 3 at pin 21 with %d LEDs", configData.ledsPerStrand);
    }
    if (configData.numStrands > 7)
    {  
      FastLED.addLeds<WS2811, 22, RGB>(leds, 7 * configData.ledsPerStrand, configData.ledsPerStrand);
      Debug.print(DBG_INFO,"Initialized strand 3 at pin 22 with %d LEDs", configData.ledsPerStrand);
    }
  }
  return true;
}

uint16_t GetDeviceId()
{
#if defined(ARDUINO_ARCH_ESP32)
  return ESP.getEfuseMac();
#else
  return ESP.getChipId();
#endif
}

const void WriteEEPROM()
{
  configData.magic = 7227;
  unsigned char* ptr = (unsigned char*) &configData;
  for (int i = 0; i< sizeof(ConfigData); i++)
  {
    EEPROM.write(i, *(ptr+i));
  }
  EEPROM.commit();
}

const void ReadEEPROM()
{
  unsigned char* ptr = (unsigned char*) &configData;
  for (int i = 0; i< sizeof(ConfigData); i++)
  {
    *(ptr+i) = EEPROM.read(i);
  }
}


const char* BoardName()
{
  if (configData.magic != 7227)
      return "rudolf";
  else
      return configData.boardName;
}


void faderLoopTask(void * parameter)
{
  while(1)
  {
    if (fader) fader->loop();
    if (FLon) FastLED.show();
    vTaskDelay(10 / portTICK_PERIOD_MS);
  }
}

void LoopTask(void * parameter);

void setup()
{
    pinMode(LevelShiftEnable, OUTPUT);
    digitalWrite(LevelShiftEnable,HIGH);  // Disable

    Serial.begin(115200);
    //Serial.begin(57600);
    Serial.print("\n\nChristmas Coder | G. Andrew Stone\nBuild ");
    Serial.println(compileDate);

    EEPROM.begin(sizeof(ConfigData));
    ReadEEPROM();
    
    Debug.setDebugLevel(DBG_VERBOSE);
    Debug.timestampOn();
    Debug.setDebugOutputStream(&Serial);
    
    pinMode(OnboardLed,OUTPUT);
    digitalWrite(OnboardLed,HIGH);
   
    dumpSysInfo();
  
    if (configData.magic != 7227)
    {
        strcpy(configData.boardName, "prancer");
        configData.numStrands = DEFAULT_NUM_STRANDS;
        configData.ledsPerStrand = NUM_LEDS_PER_STRAND;
        WriteEEPROM();
        Debug.print(DBG_INFO, "Overwrote EEPROM with defaults");
    }

    // Init LEDs
    if (!initStrands()) 
    {
      Serial.println("LED init FAILURE: halting");
      while (true) 
      {
        delay(100);
      }
    }
    digitalWrite(LevelShiftEnable, LOW);
    if (FLon) FastLED.show(); // Somehow if we don't show right away, all strands go permanently white
    progress();
    //halloween();
    //quickTest();

    delay(10);

    fader = new FadeController(leds, NumLeds);
    fader->init();
    digitalWrite(OnboardLed,LOW);  // Indicate that boot is over by turning off the blue LED

    xTaskCreate(faderLoopTask, "FaderLoop", 5000, NULL, 5, NULL);  // if higher priority then LoopTask, crash
    xTaskCreate(LoopTask, "Loop", 40000, NULL, 1, NULL);
}


int  cmdCount=0;
bool onboardLedState=0;
void toggleOnboardLed()
{
  onboardLedState=!onboardLedState;
  digitalWrite(OnboardLed, onboardLedState);
}

unsigned int parseUint(String& s, int& pos)
{
  if (pos < 0) return 0;  // return 0 if position is illegal
  if (pos >= s.length()) { pos = -pos; return 0; }  // Too far

  int end = pos;
  while (end < s.length() && (s[end] >= '0' && s[end] <= '9')) end++;
  String p = s.substring(pos,end+1);
  int ret = p.toInt();
  
  pos=end;
  if (pos >= s.length()) pos = -pos;  // Too far
  return ret; 
}

void handleHttpLine(String& line)
{
        if (line.startsWith("GET /SHOW"))
        {
          toggleOnboardLed();
          //CVT digitalLeds_drawPixels(strands, STRANDCNT);
          Debug.print(DBG_INFO, "showing leds");
        }
        if (line.startsWith("GET /SET")) 
        {
          toggleOnboardLed();
          cmdCount++;
          Debug.print(DBG_INFO,"command #: %d: %s", cmdCount, line.c_str());
          // Parse out the numbers

          int pos = 8;
          unsigned int strandIdx = parseUint(line, pos);
          if (pos < 0)
          {
            Debug.print(DBG_ERROR, "bad # for strand: %d", pos);
            return;
          } 
          pos++;
          unsigned int offset = parseUint(line, pos);
          if (pos < 0)
          {
            Debug.print(DBG_ERROR, "bad # for offset: %s", pos);
            return;
          } 
          pos++;
          unsigned int red = parseUint(line, pos);
          if (pos < 0)
          {
            Debug.print(DBG_ERROR, "bad # for red: %d", pos);
            return;
          } 
          pos++;
           unsigned int green = parseUint(line, pos);
          if (pos < 0)
          {
            Debug.print(DBG_ERROR, "bad # for green: %d", pos);
            return;
          } 
          pos++;
           unsigned int blue = parseUint(line, pos);
          if (pos < 0)
          {
            Debug.print(DBG_ERROR, "bad # for blue: %d", pos);
            return;
          }
          if (pos>0)
          {
          Debug.print(DBG_INFO, "Set %d:%d to R%d G%d B%d", strandIdx, offset, red, green, blue);
          //CVT strands[strandIdx]->pixels[offset] = pixelFromRGB(red,green,blue);
          }
          else
          {
            Debug.print(DBG_ERROR, "Parse error at: %d of %s", -1*pos, line.c_str());
          }  
        }
        // Check to see if the client request was "GET /H" or "GET /L":
        else if (line.startsWith("GET /H")) 
        {
          digitalWrite(OnboardLed, HIGH);               // GET /H turns the LED on
        }
        else if (line.startsWith("GET /L")) 
        {
          digitalWrite(OnboardLed, LOW);                // GET /L turns the LED off
        }

}

// Binary protocol: 
/* connect, send command (1st command byte cannot be 'A' through 'Z')

   Common Fields:
   
   LEDindex (16 bits, big endian):
   MSB 4 bits, 0xF = all strands, otherwise 0-7 indicates which strand
   LSB 12 bits, led index

   count (16 bits, big endian):
   0xFFFF means all LEDs, otherwise # of leds (does not wrap)
   cmds:
   bit 0x80 = display (flush LEDs from buffer to actual lights)
   0 = NOP (so 0x80 means just display)
   1 = DONE
   2 = SETNLED, LEDindex, count, uint8_t r, uint8_t g, uint8_t b
   3 = SETLEDS, LEDindex, count, uint8_t r0, uint8_t g0, uint8_t b0,uint8_t r1, uint8_t g1, uint8_t b1, ... uint8_t b(count-1)
   4 = delay (microseconds)
   5 = delayUntil
   6 = sync (write a byte back)
 */

enum
{
  CMD_NOP = 0,
  CMD_DONE = 1,
  CMD_SETNLED = 2,
  CMD_SETLEDS = 3,
  CMD_DELAY = 4,
  CMD_DELAYUNTIL = 5,
  CMD_SYNC = 6,
  CMD_FADENLED = 7,
  CMD_FADELEDS = 8,
  CMD_YANKNLED = 9,
};

/*
uint8_t readByte(WiFiClient& client, bool& aborted, int timeout=10000)
{
  uint16_t ret=0;
  int cnt = sizeof(uint16_t);
  while(client.connected())
  {
    if (client.available())
    {
      ret = client.read();
      return ret;
    }
  }
  aborted=true;
  return 0;
}

uint16_t readShort(WiFiClient& client, bool& aborted, int timeout=10000)
{
  uint16_t ret=0;
  int cnt = sizeof(uint16_t);
  while(client.connected())
  {
    if (client.available())
    {
      ret |= client.read();
      cnt--;
      if (cnt==0) return ret;
      ret <<= 8;
    }
  }
  aborted=true;
  return 0;
}
*/

int64_t micros64()
{
    static int64_t rolls = 0;
    static uint32_t lastmicros = 0;
    uint32_t n = micros();
    //uint32_t p = n;
    n += 0xFC000000UL;
    //Debug.print(DBG_INFO, "micros64 n:%lu -> %lu lastmicros: %lld", p, n, lastmicros);
    
    if (n < lastmicros) 
    {
      rolls += 0x100000000UL;
      // Debug.print(DBG_INFO, "Rolled 0x%llx", rolls);
    }
    lastmicros = n;
    int64_t now = n;
    return (now+rolls);
}

unsigned char readWait(WiFiClient& client)
{
  uint32_t start = millis();
  while (!client.available())
  {
    if (!client.connected()) 
    {
      Debug.print(DBG_INFO, "Client disconnect in readWait()");
      return 0;
    }
    vTaskDelay(1 / portTICK_PERIOD_MS);
  }
  return client.read();
}

size_t readWait(WiFiClient& client, uint8_t* buf, size_t total)
{
  size_t got=0;
  while(got < total)
  {
    while ((!client.available()) && client.connected())
    {
        vTaskDelay(1 / portTICK_PERIOD_MS);
    }
    if (!client.connected()) 
    {
      Debug.print(DBG_INFO, "Client disconnect in readWait(...)");
      return 0;
    }
    int amtRead = client.read(buf+got, total-got);
    if (amtRead < 0)
    {
      Debug.print(DBG_INFO, "Read failure in readWait(...)");
      client.stop();
      return got;
    }
    got += amtRead;
  }
  return got;
}
 
void handleBinaryProtocol(WiFiClient& client)
{
  uint32_t start = millis();
  bool done = false;
  if (1) // while (!done && client.connected()) 
  {
    unsigned char cmd = readWait(client);
    
    unsigned char flush = cmd&0x80;
    cmd = cmd&0x7f;
    unsigned char dirtyStrand = 0xff;
    //Debug.print(DBG_INFO, "CMD %d", cmd);
    switch (cmd)
    {
      case CMD_NOP:
        //Debug.print(DBG_INFO, "NOP");
        break;
      case CMD_DONE:
      {
        uint32_t magic;
        if (4 != readWait(client, (uint8_t*) &magic, 4))
        {
           Debug.print(DBG_INFO, "Received BAD done - not enough read");
        }
        if (magic != 0xb1eb1e)
        {
          Debug.print(DBG_INFO, "Received BAD done %u", magic);
        }
        else
        {
        Debug.print(DBG_INFO,"Received DONE");
        done = true;
        }
      } 
      break;
      case CMD_SETNLED: // SETNLED
      {
        //Debug.print(DBG_INFO, "set N led");
        bool aborted = false;
        uint16_t ledIdx;
        if (2 != readWait(client, (uint8_t*) &ledIdx, 2)) 
        {
          Debug.print(DBG_INFO, "SETNLED bad index read ");
          return;
        }
        uint8_t strandIdx = ledIdx >> 12;
        ledIdx &= (1<<12)-1;
        uint16_t count;
        if (2 != readWait(client, (uint8_t*) &count, 2)) 
        {
          Debug.print(DBG_INFO, "SETNLED bad count read");
          return;
        }
        uint8_t red = readWait(client);
        uint8_t grn = readWait(client);
        uint8_t blu = readWait(client);
        auto col = CRGB(red,grn,blu);

        //Debug.print(DBG_INFO, "SETNLED count: %d, start %d:%d", count, strandIdx, ledIdx); 

        if (strandIdx == 0xf) // linear map of LEDs
        {
          for (size_t j=ledIdx;(j<NumLeds) && (count>0);j++,count--)
          {
              if (fader) fader->set(j, col);
              else leds[j] = col;
          }
        }  
        else  // Indexed by strand and pixed index.  All counts remain within the strand
        {
          if (strandIdx < configData.numStrands)
          {
            dirtyStrand = strandIdx;
            count = min(ledIdx+count, (int) configData.ledsPerStrand) - ledIdx;
            ledIdx += strandIdx*configData.ledsPerStrand;
            //Debug.print(DBG_INFO, "Set %d:%d - %d to R%d G%d B%d", strandIdx, ledIdx, count, red, grn, blu);
            for (int j=ledIdx;(j<NumLeds) && (j<ledIdx+count);j++)
            {
              if (fader) fader->set(j, col);
              else leds[j] = col;
            }
          }
        }
      }
      break;
      
      case CMD_SETLEDS:
      {
        //Debug.print(DBG_INFO, "set leds");
        uint16_t ledIdx;
        if (2 != readWait(client, (uint8_t*) &ledIdx, 2)) 
        {
          Debug.print(DBG_INFO, "bad read");
          return;
        }
        uint8_t strandIdx = ledIdx >> 12;
        ledIdx &= (1<<12)-1;
        uint16_t count;
        if (2 != readWait(client,(uint8_t*) &count, 2)) 
        {
          Debug.print(DBG_INFO, "bad read");
          return;
        }

        if (count > NumLeds)
        {
          Debug.print(DBG_INFO, "bad count");
        }

        bool oneStrand = true;
        unsigned int strandStartLed=0;
        if (strandIdx != 0xf) // linear map of LEDs
        {
          ledIdx += strandIdx*configData.ledsPerStrand;
        }

        //Debug.print(DBG_INFO, "SETLEDS count: %d, start %d:%d (%s)", count, strandIdx, ledIdx, oneStrand ? "one strand":"all strands" ); 

        for (uint16_t c = 0; c<count; c++)
        {
          uint8_t red = readWait(client);
          uint8_t grn = readWait(client);
          uint8_t blu = readWait(client);
          auto col = CRGB(red,grn,blu);
          
          if (ledIdx < NumLeds)  // Even if we are off the end, keep looping because we need to read the data off the wire
          {
            if (fader) fader->set(ledIdx, col);
            else leds[ledIdx] = col;
            ledIdx++;
            // TODO if strandIdx != 0xf, don't cross strand gap
          }
        }
        
      } break;

      case CMD_YANKNLED:
     {
        bool aborted = false;
        uint16_t ledIdx;
        if (2 != readWait(client, (uint8_t*) &ledIdx, 2)) 
        {
          Debug.print(DBG_INFO, "YANKNLED bad index read ");
          return;
        }
        uint8_t strandIdx = ledIdx >> 12;
        ledIdx &= (1<<12)-1;
        uint16_t count;
        if (2 != readWait(client, (uint8_t*) &count, 2)) 
        {
          Debug.print(DBG_INFO, "YANKNLED bad count read");
          return;
        }
        uint16_t stride;
        if (2 != readWait(client, (uint8_t*) &stride, 2)) 
        {
          Debug.print(DBG_INFO, "YANKNLED bad stride read");
          return;
        }
        if (stride == 0) stride = 1;  // don't allow infinite loop
        
        uint8_t red = readWait(client);
        uint8_t grn = readWait(client);
        uint8_t blu = readWait(client);
        auto col = CRGB(red,grn,blu);

        //Debug.print(DBG_INFO, "YANKNLED count: %d, start %d:%d, color: (%d,%d,%d)", count, strandIdx, ledIdx, red,grn,blu); 

        if (strandIdx == 0xf) // linear map of LEDs
        {
          for (size_t j=ledIdx;(j<NumLeds) && (count>0);j+=stride,count--)
          {
              if (fader) fader->yank(j, col);
          }
        }  
        else  // Indexed by strand and pixed index.  All counts remain within the strand
        {
          if (strandIdx < configData.numStrands)
          {
            dirtyStrand = strandIdx;
            count = min(ledIdx+count, (int) configData.ledsPerStrand) - ledIdx;
            ledIdx += strandIdx*configData.ledsPerStrand;
            //Debug.print(DBG_INFO, "Set %d:%d - %d to R%d G%d B%d", strandIdx, ledIdx, count, red, grn, blu);
            for (int j=ledIdx;(j<NumLeds) && (count>0);j+=stride, count--)
            {
              if (fader) fader->yank(j, col);
            }
          }
        }
      } break;

      case CMD_FADENLED:
      {
        //Debug.print(DBG_INFO, "set N led");
        bool aborted = false;
        uint16_t ledIdx;
        if (2 != readWait(client, (uint8_t*) &ledIdx, 2)) 
        {
          Debug.print(DBG_INFO, "FADENLED bad index read ");
          return;
        }
        uint8_t strandIdx = ledIdx >> 12;
        ledIdx &= (1<<12)-1;
        uint16_t count;
        if (2 != readWait(client, (uint8_t*) &count, 2)) 
        {
          Debug.print(DBG_INFO, "FADENLED bad count read");
          return;
        }
        uint16_t fadeCount;
        if (2 != readWait(client, (uint8_t*) &fadeCount, 2)) 
        {
          Debug.print(DBG_INFO, "FADENLED bad fadeCount read");
          return;
        }
        uint16_t stride;
        if (2 != readWait(client, (uint8_t*) &stride, 2)) 
        {
          Debug.print(DBG_INFO, "FADENLED bad stride read");
          return;
        }
        if (stride == 0) stride = 1;  // don't allow infinite loop
        
        uint8_t red = readWait(client);
        uint8_t grn = readWait(client);
        uint8_t blu = readWait(client);
        auto col = CRGB(red,grn,blu);

        Debug.print(DBG_INFO, "FADENLED count: %d, fadeCount: %d, start %d:%d, color: (%d,%d,%d)", count, fadeCount, strandIdx, ledIdx, red,grn,blu); 

        if (strandIdx == 0xf) // linear map of LEDs
        {
          for (size_t j=ledIdx;(j<NumLeds) && (count>0);j+=stride,count--)
          {
              if (fader) fader->fade(j, fadeCount, col);
          }
        }  
        else  // Indexed by strand and pixed index.  All counts remain within the strand
        {
          if (strandIdx < configData.numStrands)
          {
            dirtyStrand = strandIdx;
            count = min(ledIdx+count, (int) configData.ledsPerStrand) - ledIdx;
            ledIdx += strandIdx*configData.ledsPerStrand;
            //Debug.print(DBG_INFO, "Set %d:%d - %d to R%d G%d B%d", strandIdx, ledIdx, count, red, grn, blu);
            for (int j=ledIdx;(j<NumLeds) && (count>0);j+=stride, count--)
            {
              if (fader) fader->fade(j, fadeCount, col);
            }
          }
        }
      } break;

      case CMD_FADELEDS:
      {
        //Debug.print(DBG_INFO, "set leds");
        uint16_t ledIdx;
        if (2 != readWait(client, (uint8_t*) &ledIdx, 2)) 
        {
          Debug.print(DBG_INFO, "bad read");
          return;
        }
        uint8_t strandIdx = ledIdx >> 12;
        ledIdx &= (1<<12)-1;
        uint16_t count;
        if (2 != readWait(client,(uint8_t*) &count, 2)) 
        {
          Debug.print(DBG_INFO, "bad read");
          return;
        }

        if (count > NumLeds)
        {
          Debug.print(DBG_INFO, "bad count");
        }
        uint16_t fadeCount;
        if (2 != readWait(client, (uint8_t*) &fadeCount, 2)) 
        {
          Debug.print(DBG_INFO, "FADENLED bad fadeCount read");
          return;
        }
        uint16_t stride;
        if (2 != readWait(client, (uint8_t*) &stride, 2)) 
        {
          Debug.print(DBG_INFO, "FADENLED bad stride read");
          return;
        }

        bool oneStrand = true;
        unsigned int strandStartLed=0;
        if (strandIdx != 0xf) // linear map of LEDs
        {
          ledIdx += strandIdx*configData.ledsPerStrand;
        }

        //Debug.print(DBG_INFO, "SETLEDS count: %d, start %d:%d (%s)", count, strandIdx, ledIdx, oneStrand ? "one strand":"all strands" ); 

        for (uint16_t c = 0; c<count; c++)
        {
          uint8_t red = readWait(client);
          uint8_t grn = readWait(client);
          uint8_t blu = readWait(client);
          auto col = CRGB(red,grn,blu);
          
          if (ledIdx < NumLeds)  // Even if we are off the end, keep looping because we need to read the data off the wire
          {
            if (fader) fader->fade(ledIdx, fadeCount, col);
            ledIdx+=stride;
            // TODO if strandIdx != 0xf, don't cross strand gap
          }
        }
        
      } break;
      
      case CMD_DELAY:
      // Implemented after the flush
      break;
      case CMD_SYNC:
      {
        static unsigned char cur = 0;
        Debug.print(DBG_INFO, "SYNC %d", cur);
        size_t written = 0;
        do 
        {
          written = client.write(cur);
          if (written != 0) 
          {
              Debug.print(DBG_INFO, "blocked %d", written);
          }
        } while (written != 1);
        Debug.print(DBG_INFO, "SYNC %d DONE", cur);
        cur++;
      }
        break;
    }
    
    if (flush) 
    {
      if (FLon && !fader) FastLED.show();
    }

    if (cmd == CMD_DELAY)
    {
        uint32_t c;
        if (4 != readWait(client, (uint8_t*) &c, 4)) 
        {
          Debug.print(DBG_INFO, "delay error");
          return;
        }   

        // Delay imagines that all other operations take 0 time.
        // So each delay waits relative to the previous delay or delayuntil
        int64_t count = c;
        int64_t delayUntil = count + lastDelay;
        Debug.print(DBG_INFO, "DELAY: %lld (%lld + %lld))", delayUntil, count, lastDelay);
        int64_t now = micros64();
        size_t faderMoves = 0;

        if (now > delayUntil) 
        {
          if (count > 0) Debug.print(DBG_INFO, "way slow");
          lastDelay = now;
        }
        else
        {
          vTaskDelay(((delayUntil - now)/1000) / portTICK_PERIOD_MS);
          lastDelay = delayUntil;
        }
    }
    else if (cmd == CMD_DELAYUNTIL)
      {
        uint32_t synctime;
        if (4 != readWait(client, (uint8_t*) &synctime, 4))
        {
           Debug.print(DBG_INFO, "Received BAD synctime - not enough read");
           return;
        }
        uint32_t now = millis() - start;       
        //Debug.print(DBG_INFO, "SYNCTIME until %d, currently %d", synctime, now);
        if (now < synctime)
        {
           vTaskDelay((synctime - now) / portTICK_PERIOD_MS);
        }
        lastDelay = micros64();
        //Debug.print(DBG_INFO, "SYNCTIME done at %d", now);
      }
  }
  //Debug.print(DBG_INFO, "Binary mode finished done=%d connected=%d", done, client.connected());
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


void progress()  // And strand signal integrity test
{
  Serial.println("Progress Test");
  for (int32_t k=0;k<4;k++)
  {
    for (int32_t j=0;j<256;j+=2)
    {
      for (int32_t i=0;i<NumLeds;i++)
      {
          auto p = i+k;
          // By setting a min color of 1, and bit shift error will push that bit into the highest bit of the next color
          // causing a nasty flash.
          if ((p&3)==0) leds[i] = CRGB(j,0x1,0x1);
          else if ((p&3)==1) leds[i] = CRGB(0x1,j,1);
          else if ((p&3)==2) leds[i] = CRGB(0x1,0x1,j);
          else if ((p&3)==3) leds[i] = CRGB(j,j,j);
      }
      if (FLon) FastLED.show();
      delayMicroseconds((2560/5)+1 - (j*2));
    }
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


void noConnectionAnimation()
{
  if (!fader) return;
  size_t fadeLength = 100;

  for (int i=0;i<NumLeds; i++)
  {
      fader->fade(i, fadeLength, CRGB(random(0,255),random(0,255),random(0,255)));
  }
  vTaskDelay((fadeLength*10) / portTICK_PERIOD_MS);  // Each fa
}

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


boolean fillNewClient()
{

  WiFiClient c = server.available();

  if (c)
  {
    for (int cidx=0; cidx < LedCtrlMaxClients; cidx++)
    {
      if (clients[cidx] && (clients[cidx].fd()==c.fd())) return false;  // Not something new 
    }
  
    for (int cidx=0; cidx < LedCtrlMaxClients; cidx++)
    {
      if (!clients[cidx]) 
      {
        IPAddress ip = c.remoteIP();
        Debug.print(DBG_INFO, "New client in slot %d fd %d coming from %d.%d.%d.%d", cidx, c.fd(), ip[0], ip[1], ip[2], ip[3] );
        clients[cidx] = c;
        clients[cidx].setNoDelay(true);
        lastDelay = micros64();
        return true;
      }
    }
  }
  return false;
}

unsigned long lastFill = 0;

void loop()
{
  vTaskDelay(10000 / portTICK_PERIOD_MS);
}

void LoopTask(void * parameter)
{
  while(1)
  {
    //Debug.print(DBG_INFO, "Loop");
    WiFiConnector();
    int emptySlots = LedCtrlMaxClients;
    int somethingHappened=0;
    
    //Debug.print(DBG_INFO, "stats: numFills: %d, last fill: %llu avg fill clock ticks: %llu", fastLEDnumFills, fastLEDlastFillDuration, fastLEDfillDuration/fastLEDnumFills);
    for (int cidx=0; cidx < LedCtrlMaxClients; cidx++)
    {  
      //Debug.print(DBG_INFO, "client Loop %d", cidx);
      if (clients[cidx] && clients[cidx].connected())  // Fill an empty slot with a new client
      {
        emptySlots--;
        WiFiClient& client = clients[cidx];
        String currentLine = "";                // make a String to hold incoming data from the client
        if (client.available())
          Debug.print(DBG_INFO, "client %d is alive, %s data", client.fd(), client.available() ? "has" : "no");
        while (client.available() && client.connected())                  // if there's bytes to read from the client,
        {
          somethingHappened++;
          handleBinaryProtocol(client);
        }
  
        if (!client.connected())
        {
          Debug.print(DBG_INFO, "Client %d idx %d Disconnected.", client.fd(), cidx);
        }
      }
  
    }


  unsigned long now = millis();
  if ((somethingHappened==0)&&(now > lastFill + MIN_CNXN_FILL_INTERVAL))
  {
      lastFill = now;
      if (fillNewClient()) somethingHappened++;
  }

  if (!somethingHappened)
  {
    if (emptySlots == LedCtrlMaxClients) 
    {
      noConnectionAnimation();
    }
    else
    {
      vTaskDelay(1 / portTICK_PERIOD_MS);
    }
  }
  }
}
