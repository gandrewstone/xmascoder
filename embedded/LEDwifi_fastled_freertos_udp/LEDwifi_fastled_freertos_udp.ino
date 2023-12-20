#include <Arduino_DebugUtils.h>
#include <EEPROM.h>
// didn't help: #define FASTLED_ALLOW_INTERRUPTS 0
// totally broken: #define FASTLED_INTERRUPT_RETRY_COUNT 1
#include <FastLED.h>
#include <AsyncUDP.h>
#include "fadeController.h"

#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include <lwip/netdb.h>

#define WIFI 1
#define FADE_STEP_MS 10  // Convert milliseconds to steps of fading
const char compileDate[] = __DATE__ " " __TIME__;

// Pick 1 UDP API
#define UDP_ASYNC
//#define UDP_SYNC
//#define UDP_SOCKET

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
const String ssid     = "xmascoder";
const String password = "";
// Change this to configure what the minimum signal strength you are willing to connect to is
const int MinRssi = -75;

const int OnboardLed = 2;
const int LevelShiftEnable = 32;

#pragma GCC diagnostic pop

const int MIN_CNXN_FILL_INTERVAL = 1000;
//#define DEFAULT_NUM_STRANDS 4 // COUNT_OF(strands);
//#define NUM_LEDS_PER_STRAND 300

#define DEFAULT_NUM_STRANDS 6 // COUNT_OF(strands);
#define NUM_LEDS_PER_STRAND 500


//#define NUM_LEDS (DEFAULT_NUM_STRANDS * NUM_LEDS_PER_STRAND)
size_t NumLeds = 0;

WiFiServer server(LedCtrlPort, LedCtrlMaxClients);
WiFiClient clients[LedCtrlMaxClients];

// Define the array of leds
CRGB *leds = nullptr;
FadeController *fader = nullptr;

bool FLon = true;  // Turn off LED driving
int64_t lastDelay = 0; 
uint32_t delayUntilStart = 0;
int dimmer = 1;

typedef struct
{
    unsigned int magic;
    unsigned int numStrands;
    unsigned int ledsPerStrand;
    char boardName[32];
} ConfigData;

ConfigData configData;

//**************************************************************************

// debugging info 
//extern volatile uint64_t fastLEDlastFillDuration;
//extern volatile uint64_t fastLEDfillDuration;
//extern volatile uint32_t fastLEDnumFills;

static SemaphoreHandle_t faderMutex = nullptr;

class Lock
{
    SemaphoreHandle_t& mutex;
    public:
    Lock(SemaphoreHandle_t& m):mutex(m) 
    {
      if ((mutex != nullptr)&&(xSemaphoreTake(mutex, portMAX_DELAY) == pdFALSE))
      {
        Serial.println("SEM NOT TAKEN");
      }
    }
    ~Lock()
    {
      if (mutex != nullptr) xSemaphoreGive(mutex);
    }
    
};

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
    //Serial.print(F("I am: "));
    //Serial.println(MyName);
 
    // Add service to MDNS-SD
    MDNS.addService("xmascoder", "udp", LedCtrlPort);
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
        Lock lock(faderMutex);
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
            while ((WiFi.status() != WL_CONNECTED) && (tries < 2))
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
      Debug.print(DBG_INFO,"Initialized strand 4 at pin 17 with %d LEDs", configData.ledsPerStrand);
    }
    if (configData.numStrands > 5)
    {  
      FastLED.addLeds<WS2811, 18, RGB>(leds, 5 * configData.ledsPerStrand, configData.ledsPerStrand);
      Debug.print(DBG_INFO,"Initialized strand 5 at pin 18 with %d LEDs", configData.ledsPerStrand);
    }
    if (configData.numStrands > 6)
    {  
      FastLED.addLeds<WS2811, 21, RGB>(leds, 6 * configData.ledsPerStrand, configData.ledsPerStrand);
      Debug.print(DBG_INFO,"Initialized strand 6 at pin 21 with %d LEDs", configData.ledsPerStrand);
    }
    if (configData.numStrands > 7)
    {  
      FastLED.addLeds<WS2811, 22, RGB>(leds, 7 * configData.ledsPerStrand, configData.ledsPerStrand);
      Debug.print(DBG_INFO,"Initialized strand 7 at pin 22 with %d LEDs", configData.ledsPerStrand);
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
    {
        Lock lock(faderMutex);
        if (fader) fader->loop();
        if (FLon) FastLED.show();
    }
    vTaskDelay(FADE_STEP_MS / portTICK_PERIOD_MS);
  }
}

void LoopTask(void * parameter);

void setup()
{
    faderMutex = xSemaphoreCreateMutex();
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
  
    if (false) // configData.magic != 7227)
    {
        strcpy(configData.boardName, "dancer");
        configData.numStrands = 6;
        configData.ledsPerStrand = 500;
        //WriteEEPROM();
        //Debug.print(DBG_INFO, "Overwrote EEPROM with defaults");
    }
    if (false) // configData.magic != 7227)
    {
        strcpy(configData.boardName, "prancer");
        configData.numStrands = 2;
        configData.ledsPerStrand = 200;
        WriteEEPROM();
        Debug.print(DBG_INFO, "Overwrote EEPROM with defaults");
    }
    if (false) // configData.magic != 7227)
    {
        strcpy(configData.boardName, "vixen");
        configData.numStrands = DEFAULT_NUM_STRANDS;
        configData.ledsPerStrand = NUM_LEDS_PER_STRAND;
        WriteEEPROM();
        Debug.print(DBG_INFO, "Overwrote EEPROM with defaults");
    }
    
    Serial.print(F("I am "));
    Serial.print(configData.boardName);
    Serial.print(".  I have ");
    Serial.print(configData.numStrands);
    Serial.print(" strands and ");
    Serial.print(configData.ledsPerStrand);
    Serial.println(" lights per strand.");
    

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

    dimpurple();
    //progress();
    //halloween();
    //quickTest();

    delay(10);

    // Inside
    if (strcmp(configData.boardName,"prancer")==0)
    {
      dimmer = 4;
    }
    else  // outside
    {
      dimmer = 1;
    }
    setStandardCols();
    //setXmasCols();

    fader = new FadeController(leds, NumLeds);
    fader->init();
    digitalWrite(OnboardLed,LOW);  // Indicate that boot is over by turning off the blue LED

    // periodically refreshes the LEDs and displays their current value
    xTaskCreate(faderLoopTask, "FaderLoop", 5000, NULL, 5, NULL);  // if higher priority then LoopTask, crash
    // xTaskCreate(LoopTask, "Loop", 40000, NULL, 1, NULL);
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
   5 = delayUntil -- pass a 0 to trigger the start point.
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
  CMD_ROTATE = 10,   // start, count, jump (negative implies direction)
};

uint64_t micros64()
{
  return esp_timer_get_time();
#if 0
    static int64_t rolls = 0;
    static uint32_t lastmicros = 0;
    uint32_t n = micros();
    //uint32_t p = n;
    //n += 0xFF000000UL;
    //Debug.print(DBG_INFO, "micros64 n:%lu -> %lu lastmicros: %lld", p, n, lastmicros);
    
    if (n < lastmicros) 
    {
      rolls += 0x100000000UL;
      //Debug.print(DBG_INFO, "Rolled 0x%llx", rolls);
    }
    lastmicros = n;
    int64_t now = n;
    return (now+rolls);
#endif
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



class BinaryProtocolPacketHandler
{
  public:
  AsyncUDP* cnxnA = nullptr;
  WiFiUDP* cnxnS = nullptr;
  AsyncUDPPacket* packet = nullptr;
  struct sockaddr_in* sender;
  size_t senderAddrLen = 0;
  int socket = -1;
  uint8_t* data;
  uint8_t* end;
  uint8_t* cur;

  BinaryProtocolPacketHandler(AsyncUDP& c, AsyncUDPPacket& pkt): cnxnA(&c), packet(&pkt), data(packet->data()),end(packet->data()+packet->length()), cur(packet->data()) {}
  BinaryProtocolPacketHandler(WiFiUDP& c, uint8_t* _data, int size): cnxnS(&c), data(_data),end(_data + size), cur(_data) {}
  BinaryProtocolPacketHandler(int sock, uint8_t* _data): socket(sock),data(_data) {}

  bool atEnd()
  {
    return (cur >= end);
  }

  size_t read(uint8_t* buf, size_t total)
  {
    register uint8_t* tmp = cur;
    cur+=total;
    if (cur > end) return 0;
    memcpy(buf, tmp, total);
    return total;
  }
  
  unsigned char read()
  {
    if (cur >= end) return 0xff;
    unsigned char ret = *cur;
    cur++;
    return ret;
  }

  void handle(size_t len, struct sockaddr_in& replyTo, size_t replyToAddrLen)
  {
    // Reset buffer
    end = data + len;
    cur = data;
    sender = &replyTo;
    senderAddrLen = replyToAddrLen;
    handle();
  }
    
  void handle()
  {
    uint32_t start = millis();
    bool done = false;
    while (!atEnd()&&!done)
    {
      unsigned char cmd = read();
      
      unsigned char flush = cmd&0x80;
      // if (cmd!=2) Debug.print(DBG_INFO, "CMD %d", cmd);
      cmd = cmd&0x7f;
      unsigned char dirtyStrand = 0xff;
      switch (cmd)
      {
        case CMD_NOP:
          //Debug.print(DBG_INFO, "NOP");
          break;
        case CMD_DONE:
        {
          uint32_t magic;
          if (4 != read((uint8_t*) &magic, 4))
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
          if (2 != read((uint8_t*) &ledIdx, 2)) 
          {
            Debug.print(DBG_INFO, "SETNLED bad index read ");
            return;
          }
          uint8_t strandIdx = ledIdx >> 12;
          ledIdx &= (1<<12)-1;
          uint16_t count;
          if (2 != read((uint8_t*) &count, 2)) 
          {
            Debug.print(DBG_INFO, "SETNLED bad count read");
            return;
          }
          uint8_t red = read();
          uint8_t grn = read();
          uint8_t blu = read();
          auto col = CRGB(red/dimmer,grn/dimmer,blu/dimmer);
  
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
          if (2 != read((uint8_t*) &ledIdx, 2)) 
          {
            Debug.print(DBG_INFO, "bad read");
            return;
          }
          uint8_t strandIdx = ledIdx >> 12;
          ledIdx &= (1<<12)-1;
          uint16_t count;
          if (2 != read((uint8_t*) &count, 2)) 
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
            uint8_t red = read();
            uint8_t grn = read();
            uint8_t blu = read();
            auto col = CRGB(red/dimmer,grn/dimmer,blu/dimmer);
            
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
          if (2 != read((uint8_t*) &ledIdx, 2)) 
          {
            Debug.print(DBG_INFO, "YANKNLED bad index read ");
            return;
          }
          uint8_t strandIdx = ledIdx >> 12;
          ledIdx &= (1<<12)-1;
          uint16_t count;
          if (2 != read((uint8_t*) &count, 2)) 
          {
            Debug.print(DBG_INFO, "YANKNLED bad count read");
            return;
          }
          uint16_t stride;
          if (2 != read((uint8_t*) &stride, 2)) 
          {
            Debug.print(DBG_INFO, "YANKNLED bad stride read");
            return;
          }
          if (stride == 0) stride = 1;  // don't allow infinite loop
          
          uint8_t red = read();
          uint8_t grn = read();
          uint8_t blu = read();
          auto col = CRGB(red/dimmer,grn/dimmer,blu/dimmer);
  
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
          if (2 != read((uint8_t*) &ledIdx, 2)) 
          {
            Debug.print(DBG_INFO, "FADENLED bad index read ");
            return;
          }
          uint8_t strandIdx = ledIdx >> 12;
          ledIdx &= (1<<12)-1;
          uint16_t count;
          if (2 != read((uint8_t*) &count, 2)) 
          {
            Debug.print(DBG_INFO, "FADENLED bad count read");
            return;
          }
          uint16_t fadeCount;
          if (2 != read((uint8_t*) &fadeCount, 2)) 
          {
            Debug.print(DBG_INFO, "FADENLED bad fadeCount read");
            return;
          }
          fadeCount /= FADE_STEP_MS;  // Convert milliseconds to steps of fading
          uint16_t stride;
          if (2 != read((uint8_t*) &stride, 2)) 
          {
            Debug.print(DBG_INFO, "FADENLED bad stride read");
            return;
          }
          if (stride == 0) stride = 1;  // don't allow infinite loop
          
          uint8_t red = read();
          uint8_t grn = read();
          uint8_t blu = read();
          auto col = CRGB(red/dimmer,grn/dimmer,blu/dimmer);
  
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
          if (2 != read((uint8_t*) &ledIdx, 2)) 
          {
            Debug.print(DBG_INFO, "bad read");
            return;
          }
          uint8_t strandIdx = ledIdx >> 12;
          ledIdx &= (1<<12)-1;
          uint16_t count;
          if (2 != read((uint8_t*) &count, 2)) 
          {
            Debug.print(DBG_INFO, "bad read");
            return;
          }
  
          if (count > NumLeds)
          {
            Debug.print(DBG_INFO, "bad count");
          }
          uint16_t fadeCount;
          if (2 != read((uint8_t*) &fadeCount, 2)) 
          {
            Debug.print(DBG_INFO, "FADENLED bad fadeCount read");
            return;
          }
          fadeCount /= FADE_STEP_MS;  // Convert milliseconds to steps of fading
          uint16_t stride;
          if (2 != read((uint8_t*) &stride, 2)) 
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
            uint8_t red = read();
            uint8_t grn = read();
            uint8_t blu = read();
            auto col = CRGB(red/dimmer,grn/dimmer,blu/dimmer);
            
            if (ledIdx < NumLeds)  // Even if we are off the end, keep looping because we need to read the data off the wire
            {
              if (fader) fader->fade(ledIdx, fadeCount, col);
              ledIdx+=stride;
              // TODO if strandIdx != 0xf, don't cross strand gap
            }
          }
          
        } break;

        case CMD_ROTATE:
        {
          //Debug.print(DBG_INFO, "rotate");
          uint16_t ledIdx;
          if (2 != read((uint8_t*) &ledIdx, 2)) 
          {
            Debug.print(DBG_INFO, "bad read");
            return;
          }
          uint8_t strandIdx = ledIdx >> 12;
          ledIdx &= (1<<12)-1;
          uint16_t count;
          if (2 != read((uint8_t*) &count, 2)) 
          {
            Debug.print(DBG_INFO, "bad read");
            return;
          }

          int16_t stride;
          if (2 != read((uint8_t*) &stride, 2)) 
          {
            Debug.print(DBG_INFO, "bad read");
            return;
          }
          if (stride == 0) break; // no rotation
    
          bool oneStrand = true;
          unsigned int strandStartLed=0;
          if (strandIdx != 0xf) // 0xf means linear map of LEDs
          {
            if (ledIdx > configData.ledsPerStrand) break; // no-op because beyond
            if (ledIdx + count > configData.ledsPerStrand)
            {
              count = configData.ledsPerStrand - ledIdx;
            }
            ledIdx += strandIdx*configData.ledsPerStrand;
          }
          else
          {
            if (ledIdx > NumLeds) break;  // no-op because beyond
            if (ledIdx + count > NumLeds)
            {
              count = NumLeds - ledIdx;
            }         
          }
          if (fader) 
          {
            // Lock lock(faderMutex);
            fader->rotate(ledIdx, count, stride);
          }
        } break;

        case CMD_DELAY:
        // Implemented after the flush
        break;
        case CMD_SYNC:
        {
          int32_t cookie;
          //Debug.print(DBG_INFO, "READ");
          if (4 != read((uint8_t*) &cookie, sizeof(int32_t))) 
          {
            Debug.print(DBG_INFO, "bad read");
            return;
          }

          if (cnxnA) 
          {
            //Debug.print(DBG_INFO, "WRITE A");
            cnxnA->writeTo((uint8_t*)&cookie, sizeof(int32_t), packet->remoteIP(), packet->remotePort());
            //Debug.print(DBG_INFO, "WRITE DONE");
          }
          
          if (cnxnS) 
          {
            //Debug.print(DBG_INFO, "WRITE S");
            cnxnS->beginPacket();
            cnxnS->write((uint8_t*)&cookie, sizeof(int32_t));
            cnxnS->endPacket();
          }
          if (socket != -1)
          {
            //Debug.print(DBG_INFO, "WRITE trad");
            int result = sendto(socket, (uint8_t*)&cookie, sizeof(int32_t), MSG_DONTWAIT, (struct sockaddr *) sender, senderAddrLen);
            if (result != sizeof(int32_t))
            {
              Debug.print(DBG_INFO, "Reply can't be sent, err %d", result);
            }
          }
          //Debug.print(DBG_INFO, "SYNC %d took %d ms", cur, millis() - start);
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
          if (4 != read((uint8_t*) &c, 4)) 
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
            if ((delayUntil - now)/1000 > 5000) Debug.print(DBG_INFO, "DELAY for %d, until %d", delayUntil - now, delayUntil);
            vTaskDelay(((delayUntil - now)/1000) / portTICK_PERIOD_MS);
            lastDelay = delayUntil;
          }
      }
      else if (cmd == CMD_DELAYUNTIL)
        {
          uint32_t synctime;
          if (4 != read((uint8_t*) &synctime, 4))
          {
             Debug.print(DBG_INFO, "Received BAD synctime - not enough read");
             return;
          }
          if (synctime == 0) delayUntilStart = millis(); // set the start mark
          else
          {
              uint32_t now = millis() - delayUntilStart;       
              if (now < synctime + 5000) Debug.print(DBG_INFO, "DELAY UNTIL %d, currently %d", synctime, now);
              if ((synctime < 600*1000)&&(now < synctime))  // Don't allow any script over 10 minutes
              {
                 vTaskDelay((synctime - now) / portTICK_PERIOD_MS);
              }
              lastDelay = micros64();
              //Debug.print(DBG_INFO, "SYNCTIME done at %d", now);
          }
        }
    }
    //Debug.print(DBG_INFO, "Binary mode packet done connected=%d", client.connected());
  }
};



void white()
{
  for (int32_t k=0;k<1000;k++)
  {
      for (int32_t i=0;i<NumLeds;i++)
      {
          leds[i] = CRGB(255,255,255);
      }
      if (FLon) FastLED.show();
      delayMicroseconds(10000);
  }
}

void dimpurple()
{
  for (int32_t k=0;k<1000;k++)
  {
      for (int32_t i=0;i<NumLeds;i++)
      {
          leds[i] = CRGB(32,8,32);
      }
      if (FLon) FastLED.show();
      delayMicroseconds(1000);
  }
}

void progress()  // And strand signal integrity test
{
  Serial.println("Progress Test");
  for (int32_t k=0;k<2;k++)
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

void noConnectionAnimation()
{
  int64_t now = micros64();
  now = now/1000000;  // convert to seconds
  now = now/420;  // convert to 7 minute periods
  static int curcolscheme = 0;
  switch(now % 2)
  {
    case 0:
       if (curcolscheme != 0)
       {
        curcolscheme = 0;
        setStandardCols();
       }
    break;
    case 1:
       if (curcolscheme != 1)
       {
        curcolscheme = 1;
        setXmasCols();
       }
    break;

  }

  if (strcmp(BoardName(),"comet")==0) signZing();
  else if (strcmp(BoardName(),"prancer")==0) insideDefault();
  else if (strcmp(BoardName(),"blitzen")==0) 
  {
    // Serial.println("no connection: running blitzen animation");
    outsideDefault();
  }
  else if (strcmp(BoardName(),"vixen")==0) 
  {
    // Serial.println("no connection: running blitzen animation");
    outsideDefault();
  }
  else outsideDefault();
  // defaultNoConnectionAnimation();
}


void defaultNoConnectionAnimation()
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

  /* rotate test 
  for (int i=0;i<fadeLength; i++)
  {
    if (true)
    {
      Lock lock(faderMutex);
      fader->rotate(44,20,-2);
      Debug.print(DBG_INFO, "Next");
    }
    
    vTaskDelay(500 / portTICK_PERIOD_MS);
  }
  */
}


void loop()
{
  //vTaskDelay(10000 / portTICK_PERIOD_MS);
  LoopTask(nullptr);
}

uint64_t lastPkt = 0;
uint npkts = 0;

#define MTU_SIZE 1500
uint8_t pktBuffer[MTU_SIZE];

void LoopTask(void * parameter)
{
  while(1)
  {
    WiFiConnector();
    if (WiFi.status() != WL_CONNECTED)
    {
      Serial.println("No connection animation");
      uint64_t noCnxnTime = 50*60;
      noCnxnTime *= 1000*1000;
      uint64_t noCnxnAniTime = micros64() + noCnxnTime;
      while (micros64() < noCnxnAniTime) noConnectionAnimation();
      Serial.println("No connection animation done");
    }
    while (WiFi.status() == WL_CONNECTED)
    {
#ifdef UDP_SOCKET      
      struct sockaddr_in udpServerAddr;
      udpServerAddr.sin_addr.s_addr = htonl(INADDR_ANY);
      udpServerAddr.sin_family = AF_INET;
      udpServerAddr.sin_port = htons(LedCtrlPort);
      int sock = socket(AF_INET, SOCK_DGRAM, 0);
      static struct sockaddr_in remoteAddr;
      static unsigned int remoteAddrLen;
      
      if(sock >= 0) 
      {
        // Set nonblocking mode
        //int err = fcntl (sock, F_SETFL , O_NONBLOCK );
        //if (err < 0)
        //{
        //  Debug.print(DBG_INFO, "Cant set nonblocking socket mode");
        //}
        if(bind(sock, (struct sockaddr *)&udpServerAddr, sizeof(udpServerAddr)) != 0) 
        {
            close(sock);
            vTaskDelay(4000 / portTICK_PERIOD_MS);
            continue;
        }
        else
        {
          BinaryProtocolPacketHandler hdlr(sock, pktBuffer);
          while(WiFi.status() == WL_CONNECTED)
            { 
              int count = 0;
              do
              {
                remoteAddrLen = sizeof(remoteAddr);
                count = recvfrom(sock, pktBuffer, MTU_SIZE, 0, (struct sockaddr *)&remoteAddr, &remoteAddrLen);
                Debug.print(DBG_INFO, "Received %d", count);
                if (count > 0) hdlr.handle(count, remoteAddr, remoteAddrLen);
              } while(count>0);
              
            }
            close(sock);
        }
      }
#endif
#ifdef UDP_SYNC   // Same as above, different API
      WiFiUDP udp;
      Debug.print(DBG_INFO, "Registered UDP listener");
      udp.begin(LedCtrlPort);
      while(WiFi.status() == WL_CONNECTED)
      {    
        int pktSize = udp.parsePacket();
        if (pktSize)
        {
          // Debug.print(DBG_INFO, "%llu: received sz %d", micros64(), pktSize);
          pktSize = udp.read(pktBuffer, MTU_SIZE); 
          if (pktSize > 0)
          {
            BinaryProtocolPacketHandler(udp, pktBuffer, pktSize).handle();
          }
        }
      }
#endif      
#ifdef UDP_ASYNC     // Same as above, different API
      AsyncUDP udp;
       
      if (udp.listen(LedCtrlPort))
      {
        Debug.print(DBG_INFO, "Registered UDP listener");
        udp.onPacket([&udp](AsyncUDPPacket packet)
        {
          BinaryProtocolPacketHandler(udp, packet).handle();
          //if ((npkts&31)==0) Debug.print(DBG_INFO, "%lu: UDP size %d", npkts, packet.length());
          lastPkt = micros64();
          npkts++;
        });
      }
      
      while(WiFi.status() == WL_CONNECTED)
      {    
        if (micros64() > lastPkt + 30000000UL)  // If no control for 30 seconds, do you own ani
        {
            noConnectionAnimation();
        }
        else
        {
            vTaskDelay(10000 / portTICK_PERIOD_MS);
        }
      }
#endif
    }
  }
}
