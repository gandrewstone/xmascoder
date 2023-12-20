// Copyright 2015 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fstream>
#include <sstream>
#include <string>
#include <cerrno>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <netinet/in.h>

#include "include/libplatform/libplatform.h"
#include "include/v8.h"

#include "ledctrlesp32.h"

FILE* logfd=NULL;
#define SET_PIXELS_CHUNK 20
#define MAX_SCRIPT_RUN_TIME (6000ULL*1000*1000*1000)
#define SCRIPT_READY_CHECK (15ULL*1000*1000*1000)
#define CANNED_SCRIPT_TIME 15

#define REQUESTED_SCRIPT 1

extern int deviceFinder();
extern int xmas2021(LedCtrl& tree, unsigned int time);

// Returns stopwatch time in nanoseconds
uint64_t GetStopwatch()
{
    struct timespec t;
    if (clock_gettime(CLOCK_MONOTONIC, &t) == 0)
    {
        uint64_t ret = t.tv_sec;
        ret *= 1000ULL * 1000ULL * 1000ULL; // convert sec to nsec
        ret += t.tv_nsec;
        return ret;
    }
    return 0;
}

inline uint32_t rgb(int red, int green, int blue)
{
    // saturation
    if (red < 0) red = 0;
    if (green < 0) green = 0;
    if (blue < 0) blue = 0;
    if (red > 255) red = 255;
    if (green > 255) green = 255;
    if (blue > 255) blue = 255;
    return (red << 16) | (green << 8) | blue;
}

uint64_t scriptStartTime=0;
uint64_t lastCheck=0;
bool     requestedScript=false;
uint32_t ledmem[NUMLEDS];

const uint32_t DIRTYBIT = 1<<31;

std::string ReadFile(const char *filename)
{
    std::ifstream in(filename, std::ios::in | std::ios::binary);
    if (in)
    {
        std::ostringstream contents;
        contents << in.rdbuf();
        in.close();
        return(contents.str());
    }
    return std::string();
}

#include <iostream>
#include <sys/socket.h>
#include <resolv.h>
#include <arpa/inet.h>

#define PORT 80
#define HOST "christmascoder.com"
//#define HOST "www.hackmyxmas.com"

//#define PORT 8000
//#define HOST "192.168.1.100"
//#define HOST "127.0.0.1"

int CloudConnect(std::string host="")
{
    int s, error;
    struct sockaddr_in addr;

    if (host == "") host = HOST;

    if ((s = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    {
        return -1;
    }

    addr.sin_family = AF_INET;

    struct addrinfo hints;
    struct addrinfo *servinfo; // will point to the results

    memset(&hints, 0, sizeof hints); // make sure the struct is empty
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM; // TCP stream sockets
    int status = getaddrinfo(HOST, NULL, &hints, &servinfo);
    if (status != 0)
    {
        fprintf(logfd, "DNS lookup failed\n");
        close(s);
        return -1;
    }

    memcpy(&addr, ((struct sockaddr_in *)servinfo[0].ai_addr), sizeof(struct sockaddr_in));
    //addr = *((struct sockaddr_in *)servinfo[0].ai_addr);
    //inet_aton(HOST, &addr.sin_addr);

    addr.sin_port = htons(PORT);

    error = connect(s, (sockaddr *)&addr, sizeof(addr));
    if (error != 0)
    {
        fprintf(logfd, "http connect failed\n");
        close(s);
        return -1;
    }
    return s;
}

std::string ReadCloudFile(std::string host="")
{
    int s = CloudConnect();
    if (s == -1) return std::string();

    // char msg[] = "GET /API/1.0/newscript HTTP/1.1\r\nHost: localhost\r\nUser-Agent:jsLed\r\nAccept: text/html\r\nAccept-Language: en-US,en;q=0.5\r\nConnection: keep-alive\r\nUpgrade-Insecure-Requests:1\r\n\r\n";
    char msg[] = "GET /API/1.0/playscript\r\n\r\n";
    // char msg[] = "GET /API/1.0/newscript HTTP/1.1\r\nHost: localhost\r\nUser-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:57.0) Gecko/20100101 Firefox/57.0\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Language: en-US,en;q=0.5\r\nAccept-Encoding: gzip, deflate\r\nConnection: keep-alive\r\nUpgrade-Insecure-Requests: 1\r\nIf-None-Match: W/\"3c-DLhUIlq0UeREuRDKBlp2VZem0jk\"\r\n\r\n";
    // char msg[] = "GET /API/1.0/newscript HTTP/1.1\r\nHost: localhost\r\nUser-Agent:jsLed\r\nAccept: text/html\r\nConnection: close\r\n\r\n";

    char *resp = (char *)malloc(0x10000);

    send(s, msg, strlen(msg), 0);

    std::string ret;
    ssize_t sz = 0;
    while ((sz = recv(s, resp, 0x10000, 0)) > 0)
    {
        ret.append(resp, sz);
    }
    free(resp);
    close(s);
    int headerSplit = ret.find("\r\n\r\n");
    std::string script = ret.substr(headerSplit+4);
    // fprintf(logfd, "script:\n%s\n", script.c_str());
    return script;
}

int ReadCloudQueueSize()
{
    int s = CloudConnect();

    char msg[] = "GET /API/1.0/queuesize\r\n\r\n";

    char *resp = (char *)malloc(0x1000);

    send(s, msg, strlen(msg), 0);

    std::string ret;
    ssize_t sz = 0;
    while ((sz = recv(s, resp, 0x1000, 0)) > 0)
    {
        ret.append(resp, sz);
    }
    free(resp);
    close(s);
    int headerSplit = ret.find("\r\n\r\n");
    std::string queLenStr = ret.substr(headerSplit+4);
    try
    {
        return std::stoi(queLenStr);
    }
    catch (...) // std::invalid_argument
    {
        return 0;
    }
}



LedCtrl* leds=NULL;

bool str2Col(const char *str, unsigned int &r, unsigned int &g, unsigned int &b)
{
    sscanf(str, "%02x%02x%02x", &r, &g, &b);
    return true;
}

bool strVal2Col(const v8::Local<v8::Value> &input, unsigned int &r, unsigned int &g, unsigned int &b)
{
    v8::String::Utf8Value v8s(input);
    const char *s = *v8s;
    if (s[0] == '#')
        s++;
    r = 0, g = 0, b = 0;
    str2Col(s, r, g, b);
    return true;
}

bool strVal2Col(const v8::Local<v8::Value> &input, int &r, int &g, int &b)
{
    v8::String::Utf8Value v8s(input);
    const char *s = *v8s;
    if (s[0] == '#')
        s++;
    unsigned int re = 0, gr = 0, bl = 0;
    str2Col(s, re, gr, bl);
    r = re;
    g = gr;
    b = bl;
    return true;
}

void SetLightCached(const v8::FunctionCallbackInfo<v8::Value>& args)
{
    if (args.Length() == 4)
    {
        int led = args[0]->Uint32Value();
        if ((led < NUMLEDS)&&(led>=0))
        {
            ledmem[led] = DIRTYBIT | rgb(args[1]->Int32Value(), args[2]->Int32Value(), args[3]->Int32Value());
        }
    }
    if (args.Length() == 2)
    {
        int led = args[0]->Uint32Value();
        if ((led < NUMLEDS)&&(led>=0)&&(args[1]->IsString()))
        {
            unsigned int r,g,b;
            strVal2Col(args[1], r, g, b);
            ledmem[led] = DIRTYBIT | rgb(r,g,b);
        }
    }
}

void SetLightDirect(const v8::FunctionCallbackInfo<v8::Value>& args)
{
    if (args.Length() == 4)
        leds->SetLed(args[0]->Uint32Value(), args[1]->Uint32Value(), args[2]->Uint32Value(), args[3]->Uint32Value());
    if (args.Length() == 2)
    {
        if (args[1]->IsString())
        {
            unsigned int r,g,b;
            strVal2Col(args[1], r, g, b);
            leds->SetLed(args[0]->Uint32Value(), r, g, b);
        }
    }
}

void SetNLights(const v8::FunctionCallbackInfo<v8::Value> &args)
{
    int32_t start;
    int32_t count;
    uint32_t col;
    int r,g,b;
    bool show = false;
    bool ok=false;
    if (args.Length() > 2)
    {
        start = args[0]->Int32Value();
        count = args[1]->Int32Value();
        if (start > NUMLEDS) return;
        if (start < 0) { start = 0; count = count+start; }
        if (count <= 0) return; // all bulbs are negative
        if (start + count > NUMLEDS) count = NUMLEDS-start;
    }

    if (args.Length() >= 5)
    {
        r = args[2]->Int32Value();
        g = args[3]->Int32Value();
        b = args[4]->Int32Value();
        if (args.Length() == 6) show = args[4]->BooleanValue();
        leds->SetNLed(start, count, r, g, b, show);
        ok = true;
    }
    else if (args.Length() >= 3)
    {
        if (args[2]->IsString())
        {
            strVal2Col(args[2], r, g, b);
            if (args.Length() == 4) show = args[3]->BooleanValue();
            leds->SetNLed(start, count, r, g, b, show);
            ok = true;
        }
    }

    if (ok)  // maintain the color array in case we update the LEDs in some later function
    {
        int end = start+count;
        col = rgb(r,g,b);
        for (int i=start; i<end;i++)
        {
            ledmem[i] = col;  // I don't set DIRTYBIT here because I already updated
        }
    }
}

void FadeNLights(const v8::FunctionCallbackInfo<v8::Value> &args)
{
    int32_t start;
    int32_t count;
    int32_t fadeCount;
    int32_t stride = 1;
    uint32_t col = 0;
    int r=0,g=0,b=0;
    bool ok=false;
    if (args.Length() >= 3)
    {
        start = args[0]->Int32Value();
        count = args[1]->Int32Value();
        fadeCount = args[2]->Int32Value();
        if (start > NUMLEDS) return;
        if (start < 0) { start = 0; count = count+start; }
        if (count <= 0) return; // all bulbs are negative
        if (start + count > NUMLEDS) count = NUMLEDS-start;
        if (fadeCount < 0) return;
    }

    if (args.Length() == 3)
    {
        leds->FadeNLed(start, count, fadeCount, 0, 0, 0);
        ok = true;
    }
    else
    {
        int argAt = 3;
        if (args[argAt]->IsString())
        {
            strVal2Col(args[argAt++], r, g, b);
            argAt++;
        }
        else
        {
            r = args[argAt++]->Int32Value();
            g = args[argAt++]->Int32Value();
            b = args[argAt++]->Int32Value();
        }

        if (args.Length() == argAt)
        {
            leds->FadeNLed(start, count, fadeCount, r, g, b, 1);
            ok = true;
        }
        else
        {
            stride = args[argAt++]->Int32Value();
            leds->FadeNLed(start, count, fadeCount, r, g, b, stride);
            ok = true;
        }
    }

    if (false && ok) // TODO (ok)  // maintain the color array in case we update the LEDs in some later function
    {
        int end = start+count;
        col = rgb(r,g,b);
        for (int i=start; i<end;i++)
        {
            ledmem[i] = col;  // I don't set DIRTYBIT here because I already updated
        }
    }
}


void RotateLights(const v8::FunctionCallbackInfo<v8::Value> &args)
{
    int32_t start;
    int32_t count;
    int32_t stride = 1;
    try
    {
        if (args.Length() == 0)
        {
            leds->Rotate(0,NUMLEDS,1);
        }
        if (args.Length() == 1)
        {
            stride = args[0]->Int32Value();
            leds->Rotate(0,NUMLEDS,stride);
        }
        if (args.Length() == 3)
        {
            start = args[0]->Int32Value();
            count = args[1]->Int32Value();
            stride = args[2]->Int32Value();
            leds->Rotate(start,count,stride);
        }
    }
    catch (...) // probably gave bad values
    {
        return;
    }
}



void SetLightsSubarray(const v8::FunctionCallbackInfo<v8::Value> &args)
{
    if (args.Length() == 3)
    {
        if (args[2]->IsUint32Array())
        {
            int len = args[1]->Uint32Value();
            if (len > NUMLEDS)
                return;
            v8::Uint32Array *arr = v8::Uint32Array::Cast(*args[2]);
            auto arrayLen = arr->ByteLength();
            if (arrayLen > NUMLEDS * sizeof(uint32_t))
                return;
            if (arrayLen < len * sizeof(uint32_t))
                len = arrayLen/sizeof(uint32_t);
            leds->SetLeds(args[0]->Uint32Value(), len, (uint32_t*) arr->Buffer()->GetContents().Data());
        }
    }
}

#if 0
void SetLights(const v8::FunctionCallbackInfo<v8::Value>& args)
{
    if (args.Length() == 2)
    {
        if (args[1]->IsUint32Array())
        {
            v8::Uint32Array* arr=v8::Uint32Array::Cast(*args[2]);
            auto arrayLen = arr->Length();
            printf("al: %lu\n", arrayLen);
            if (arrayLen > NUMLEDS) return;
            uint32_t* tmp = (uint32_t*) malloc(arrayLen);
            if (!tmp) return;
            arr->CopyContents(tmp,arr->ByteLength());
            leds->SetLeds(args[0]->Uint32Value(), ((unsigned int)arrayLen)/((unsigned int)sizeof(uint32_t)), tmp);
            free(tmp);
        }

    }
}
#endif

void UpdateLights()
{
    for (int i=0;i<NUMLEDS;i++)
    {
        if (ledmem[i]&DIRTYBIT)
        {
            auto amt = std::min(SET_PIXELS_CHUNK, NUMLEDS-i);
            leds->SetLeds(i, amt, &ledmem[i]);
            for (int j=0;j<amt;j++) // clear the dirty bit because we sent it
                ledmem[j+i] = ledmem[j+i] & ~DIRTYBIT;
            i+=SET_PIXELS_CHUNK-1;  // -1 because for loop increments
        }
    }
    leds->ShowLeds();
}

void UpdateLights(const v8::FunctionCallbackInfo<v8::Value>& args)
{
    UpdateLights();
}

void milliDelay(const v8::FunctionCallbackInfo<v8::Value>& args)
{
    // UpdateLights();  // If we are caching individual sets we need to flush now
    if (args.Length() == 1)
    {
        if (GetStopwatch() > scriptStartTime + MAX_SCRIPT_RUN_TIME)
        {
            v8::Isolate* iso = args.GetIsolate();
            iso->ThrowException(v8::String::NewFromUtf8(iso, "Script ran too long!"));
        }
        if (!requestedScript && (GetStopwatch() > lastCheck + SCRIPT_READY_CHECK))
        {
            lastCheck = GetStopwatch();
            int Qsize = ReadCloudQueueSize();
            if (Qsize > 0)
            {
                v8::Isolate* iso = args.GetIsolate();
                iso->ThrowException(v8::String::NewFromUtf8(iso, "Script abort because others queued up."));
            }
        }
        int len = args[0]->Int32Value();
        if (len <= 0) return;
        if (len > 10*1000) len = 10*1000; // max delay is 10 seconds

        // If > 100 ms, synchronize with the tree, otherwise just delay yourself
        // BUG, TODO: Set this to > 0 to see the WiFi network delay issues
        // (periodically it drops into 400ms round trip time, normally its doing < 5 ms RTT)
        if (len > 100) leds->SyncDelay(len*1000);
        else
        {
            leds->ShowLeds();  // low time, flush but don't sync
            usleep(len*1000);
        }
    }
}

void milliDelayUntil(const v8::FunctionCallbackInfo<v8::Value>& args)
{
    // UpdateLights();   // If we are caching individual sets we need to flush now
    if (args.Length() == 1)
    {
        if (GetStopwatch() > scriptStartTime + MAX_SCRIPT_RUN_TIME)
        {
            v8::Isolate* iso = args.GetIsolate();
            iso->ThrowException(v8::String::NewFromUtf8(iso, "Script ran too long!"));
        }
        if (!requestedScript && (GetStopwatch() > lastCheck + SCRIPT_READY_CHECK))
        {
            lastCheck = GetStopwatch();
            int Qsize = ReadCloudQueueSize();
            if (Qsize > 0)
            {
                v8::Isolate* iso = args.GetIsolate();
                iso->ThrowException(v8::String::NewFromUtf8(iso, "Script abort because others queued up."));
            }
        }
        int len = args[0]->Int32Value();
        if (len <= 0) return;
        if (len > 600*1000) return;  // No scripts > 10 minutes.
        leds->DelayUntil(len*1000);
    }
}


void jsRandomInt(const  v8::FunctionCallbackInfo<v8::Value>&args)
{
    unsigned int max=NUMLEDS;
    if (args.Length() == 1) max=args[0]->Uint32Value();
    unsigned int val = rand()%max;

    args.GetReturnValue().Set(v8::Uint32::New(args.GetIsolate(), val));
}

void jsPrint(const  v8::FunctionCallbackInfo<v8::Value>&args)
{
    // print is a no-op when running for real
}



int main(int argc, char *argv[])
{
    deviceFinder();
    // FILE* fd = fopen("log.txt", "wb");
    logfd = stdout; // fd;

    fprintf(logfd, "log initialized\n");
    fflush(logfd);

    //const char* hwIp = "dancer.local";
    const char* hwIp = "cupid.local";
    if (argc > 1) hwIp = argv[1];

    //LedCtrl ledctrl(NUMLEDS);
    // LedCtrl ledctrl("192.168.1.159", NUMLEDS);
    //LedCtrl ledctrl("dancer.local", NUMLEDS);
    LedCtrl ledctrl(hwIp, NUMLEDS);
    //LedCtrl ledctrl("192.168.0.53", NUMLEDS);
    leds = &ledctrl;

    //leds->SetTime(80000000UL);
    //leds->SetTime(10000000UL);
    //leds->SetTime(200000000UL);
    leds->SetTime(0UL);

    
    // Initialize V8.
    v8::V8::InitializeICUDefaultLocation(argv[0]);
    v8::V8::InitializeExternalStartupData(argv[0]);
    std::unique_ptr<v8::Platform> platform = v8::platform::NewDefaultPlatform();
    v8::V8::InitializePlatform(platform.get());
    v8::V8::Initialize();
    fprintf(logfd, "V8 initialized\n");
    fflush(logfd);
    while (1)
    {
        //xmas2021(*leds, 20);
        // Create a new Isolate and make it the current one.
        v8::Isolate::CreateParams create_params;
        create_params.array_buffer_allocator = v8::ArrayBuffer::Allocator::NewDefaultAllocator();
        v8::Isolate *isolate = v8::Isolate::New(create_params);
        do  // So I can break out of this
        {
            v8::Isolate::Scope isolate_scope(isolate);

            // Create a stack-allocated handle scope.
            v8::HandleScope handle_scope(isolate);

            // Install primitive LED control functions
            v8::Local<v8::ObjectTemplate> global = v8::ObjectTemplate::New(isolate);
            global->Set(
                v8::String::NewFromUtf8(isolate, "updateLights"), v8::FunctionTemplate::New(isolate, UpdateLights));
            global->Set(
                v8::String::NewFromUtf8(isolate, "setManyLights"), v8::FunctionTemplate::New(isolate, SetNLights));
            global->Set(
                v8::String::NewFromUtf8(isolate, "setLightsTo"), v8::FunctionTemplate::New(isolate, SetNLights));
            global->Set(
                v8::String::NewFromUtf8(isolate, "fadeLights"), v8::FunctionTemplate::New(isolate, FadeNLights));
            global->Set(v8::String::NewFromUtf8(isolate, "setLight"), v8::FunctionTemplate::New(isolate, SetLightDirect));
            global->Set(v8::String::NewFromUtf8(isolate, "setLights"), v8::FunctionTemplate::New(isolate, SetLightsSubarray));
            global->Set(v8::String::NewFromUtf8(isolate, "rotateLights"), v8::FunctionTemplate::New(isolate, RotateLights));
            global->Set(v8::String::NewFromUtf8(isolate, "delay"), v8::FunctionTemplate::New(isolate, milliDelay));
            global->Set(v8::String::NewFromUtf8(isolate, "delayUntil"), v8::FunctionTemplate::New(isolate, milliDelayUntil));
            global->Set(v8::String::NewFromUtf8(isolate, "random"),v8::FunctionTemplate::New(isolate,jsRandomInt));
            global->Set(v8::String::NewFromUtf8(isolate, "print"), v8::FunctionTemplate::New(isolate, jsPrint));

            // Create a new context.
            // v8::Local<v8::Context> context = v8::Context::New(isolate,NULL, namespc);
            v8::Local<v8::Context> context = v8::Context::New(isolate, NULL, global);
            fprintf(logfd, "V8 isolated context created\n");
            fflush(logfd);

            // Enter the context for compiling and running the hello world script.
            v8::Context::Scope context_scope(context);

            //std::string program = ReadFile("../hmxweb/public/examples/help.js");
            std::string program = ReadCloudFile();
            if (program == std::string()) // nothing
            {
                xmas2021(*leds, CANNED_SCRIPT_TIME);
                break;
            }

            fprintf(logfd, "Script read\n");
            fprintf(logfd, "%s", program.c_str());
            fflush(logfd);

            // Create a string containing the JavaScript source code.
            // first 16 bytes is info
            requestedScript = program[0] == 'r';
            v8::Local<v8::String> script =
                v8::String::NewFromUtf8(isolate, program.substr(16).c_str(), v8::NewStringType::kNormal).ToLocalChecked();

            v8::TryCatch try_catch(isolate);

            // Compile the source code.
            v8::Local<v8::Script> compiled_script;
            if (!v8::Script::Compile(context, script).ToLocal(&compiled_script))
            {
                v8::String::Utf8Value error(isolate, try_catch.Exception());
                // Log(*error);
                // The script failed to compile; bail out.
                fprintf(logfd, "Compile ERROR: %s\n", *error);
                fflush(logfd);
            }
            else
            {
                // Run the script to get the result.
                v8::Local<v8::Value> result;
                leds->DelayUntil(0); // Restart the delay offset
                scriptStartTime = lastCheck = GetStopwatch();
                if (!compiled_script->Run(context).ToLocal(&result))
                {
                    // The TryCatch above is still in effect and will have caught the error.
                    v8::String::Utf8Value error(isolate, try_catch.Exception());
                    fprintf(logfd, "Execution ERROR: %s\n", *error);
                    fflush(logfd);
                    // Log(*error);
                }
                else
                {
                    // Convert the result to an UTF8 string and print it.
                    v8::String::Utf8Value utf8(isolate, result);
                    fprintf(logfd, "Result %s\n", *utf8);
                    fflush(logfd);
                }
            }
        } while(0);

        // Dispose the isolate and tear down V8.
        isolate->Dispose();
        delete create_params.array_buffer_allocator;

        fflush(logfd);
        sleep(1);
    }
    v8::V8::Dispose();
    v8::V8::ShutdownPlatform();
    return 0;
}
