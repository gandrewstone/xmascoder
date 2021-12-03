#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <signal.h>

#include <sys/ioctl.h>
#include <termios.h>

#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <netinet/tcp.h>

#include "hid.h"
#include "ledctrlesp32.h"

inline unsigned int min(unsigned int a, unsigned int b)
{
    if (a<b) return a;
    return b;
}

#pragma pack(push, 1)
class CmdSetPix
{
  public:
    uint8_t  cmd;
    uint16_t pixelIdx;
    uint16_t count;
    unsigned char red;
    unsigned char grn;
    unsigned char blu;
};

class CmdFadePix
{
  public:
    uint8_t  cmd;
    uint16_t pixelIdx;
    uint16_t count;
    uint16_t fadeCount;
    uint16_t  stride;
    unsigned char red;
    unsigned char grn;
    unsigned char blu;
};
class CmdYankPix
{
  public:
    uint8_t  cmd;
    uint16_t pixelIdx;
    uint16_t count;
    uint16_t  stride;
    unsigned char red;
    unsigned char grn;
    unsigned char blu;
};

class CmdSetLedsHeader
{
  public:
    uint8_t  cmd;
    uint16_t pixelIdx;
    uint16_t count;
};
#pragma pack(pop)

enum
{
  CMD_NOP = 0,
  CMD_QUIT = 1,
  CMD_SET_N_PIXEL = 2,
  CMD_SET_PIXELS = 3,
  CMD_DELAY = 4,
  CMD_DELAYUNTIL = 5,
  CMD_SYNC = 6,
  CMD_FADE_N_PIXEL = 7,
  CMD_FADE_PIXELS = 8,
  CMD_YANK_N_PIXEL = 9,
  CMD_SHOW = 0x80,
};

#define HMXPORT "1225"

void error(const char* errstr)
{
    printf("%s\n",errstr);
}

LedCtrl::LedCtrl(std::string ip, unsigned int numLeds, unsigned int perStrand): ledsPerStrand(perStrand), nodeAddress(ip)
{
    struct sigaction sig = {SIG_IGN};
    sigaction(SIGPIPE, &sig, NULL);  // don't exit on disconnect

    buf = new unsigned char[sizeof(CmdSetLedsHeader) + numLeds*3 + 1000];  // 5 is header size, 3 bytes per led * numLeds, for biggest SetLeds
    reconnect();
}

void LedCtrl::reconnect()
{
    printf("Led control connecting to %s\n", nodeAddress.c_str());

    struct addrinfo hints, *res;
    int errcode;

    memset (&hints, 0, sizeof (hints));
    hints.ai_family = PF_INET; // PF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_protocol = IPPROTO_TCP;
    hints.ai_flags |= AI_CANONNAME;
    errcode = getaddrinfo (nodeAddress.c_str(), HMXPORT, &hints, &res);
    if (errcode != 0)
    {
        perror ("getaddrinfo");
        sleep(1);
        return;
    }
    if (!res)
    {
        error("ERROR opening socket");
        sleep(1);
        return;
    }

    sock = socket(res->ai_family, res->ai_socktype, res->ai_protocol);
    if (sock < 0)
    {
        error("ERROR opening socket");
        sleep(1);
        return;
    }

    struct timeval tv;
    tv.tv_sec = 0; // timeout_in_seconds;
    tv.tv_usec = 500*1000;
    setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, (const char*)&tv, sizeof tv);

    int flag = 1;
    if (setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE, (void *)&flag, sizeof(flag)))
    {
        perror("ERROR: setsocketopt(), SO_KEEPALIVE");
        return;
    };

    flag = 1;
    int result = setsockopt(sock, IPPROTO_TCP, TCP_NODELAY, (char *) &flag, sizeof(int));
    if (result < 0)
    {
        error("can't disable nagle");
        sleep(1);
        return;
    }

    // struct sockaddr_in serv_addr;
    /*
    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = res->ai_family; // AF_INET;
    memcpy((char *)&serv_addr.sin_addr.s_addr, res->ai_addr->sa_data, res->ai_addrlen);
    serv_addr.sin_port = htons(HMXPORT);

    if (connect(sock, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
    {
        error("ERROR connecting");
        sleep(1);
        return;
    }
    */
    if (connect(sock, res->ai_addr, res->ai_addrlen) < 0)
    {
        perror("ERROR connecting");
        sleep(1);
        return;
    }

    isConnected=true;

    /*
    printf("opened, syncing...\n");
    if (Sync(5*1000*1000))  // First connection sync can take awhile because embedded is doing its own show
    {
        printf("connected\n");
    }
    else
    {
        printf("sync failed\n");
    }
    */

    freeaddrinfo(res);
}

void LedCtrl::disconnect()
{
    shutdown(sock, 2);
    close(sock);
    sock = -1;
    isConnected = false;
    sleep(1);
}

LedCtrl::~LedCtrl()
{
    delete[] buf;
}

int LedCtrl::sendRetry(char* buf, size_t total)
{
    if (!isConnected) reconnect();
    if (!isConnected) return 0;
    size_t amt = 0;
    do
    {
        int result = send(sock,(char*) buf+amt,total-amt,0);
        if (result < 0)
        {
            int err = errno;
            if (err == EINTR)
            {
                printf("send EINTR\n");
                result = 0;
            }
            else if (err == EAGAIN)
            {
                printf("send EAGAIN\n");
                result = 0;
            }
            else
            {
                printf("send returned errno %d (%s)\n", err, strerror(err));
                disconnect();
                return amt;
            }
        }
        amt += result;
    } while (amt < total);
    return amt;
}

void LedCtrl::SetLed(unsigned int i, unsigned char r, unsigned char g, unsigned char b, bool show)
{
    // printf("SetLed(%d,%d,%d,%d,%s)\n", i, r, g, b, show ? "show":"_");
    CmdSetPix p;
    p.cmd = CMD_SET_N_PIXEL;
    if (show) p.cmd |= CMD_SHOW;
    p.pixelIdx = (0xf << 12) | i;
    p.count = 1;
    p.red = r;
    p.grn = g;
    p.blu = b;
    sendRetry((char*) &p,sizeof(CmdSetPix));
    //flush(sock);
}

void LedCtrl::SetNLed(unsigned int i, unsigned int count, unsigned char r, unsigned char g, unsigned char b, bool show)
{
    // printf("SetNLed(%d,%d,%d,%d,%d,%s)\n", i, count, r, g, b, show ? "show":"_");
    CmdSetPix p;
    p.cmd = CMD_SET_N_PIXEL;
    if (show) p.cmd |= CMD_SHOW;
    p.pixelIdx = (0xf << 12) | i;
    p.count = count;
    p.red = r;
    p.grn = g;
    p.blu = b;
    sendRetry((char*) &p,sizeof(CmdSetPix));
    //flush(sock);
}


void LedCtrl::FadeLed(unsigned int i, unsigned int fadeCount, unsigned char r, unsigned char g, unsigned char b, bool show)
{
    // printf("SetLed(%d,%d,%d,%d,%s)\n", i, r, g, b, show ? "show":"_");
    CmdFadePix p;
    p.cmd = CMD_FADE_N_PIXEL;
    if (show) p.cmd |= CMD_SHOW;
    p.pixelIdx = (0xf << 12) | i;
    p.count = 1;
    p.fadeCount = fadeCount;
    p.red = r;
    p.grn = g;
    p.blu = b;
    sendRetry((char*) &p,sizeof(CmdFadePix));
}

void LedCtrl::FadeNLed(unsigned int i, unsigned int count, unsigned int fadeCount, unsigned char r, unsigned char g, unsigned char b, unsigned int stride, bool show)
{
    // printf("SetNLed(%d,%d,%d,%d,%d,%s)\n", i, count, r, g, b, show ? "show":"_");
    CmdFadePix p;
    p.cmd = CMD_FADE_N_PIXEL;
    if (show) p.cmd |= CMD_SHOW;
    p.pixelIdx = (0xf << 12) | i;
    p.count = count;
    p.fadeCount = fadeCount;
    p.stride = stride;
    p.red = r;
    p.grn = g;
    p.blu = b;
    sendRetry((char*) &p,sizeof(CmdFadePix));
}

void LedCtrl::YankLed(unsigned int i, unsigned char r, unsigned char g, unsigned char b, bool show)
{
    // printf("SetLed(%d,%d,%d,%d,%s)\n", i, r, g, b, show ? "show":"_");
    CmdYankPix p;
    p.cmd = CMD_YANK_N_PIXEL;
    if (show) p.cmd |= CMD_SHOW;
    p.pixelIdx = (0xf << 12) | i;
    p.count = 1;
    p.red = r;
    p.grn = g;
    p.blu = b;
    sendRetry((char*) &p,sizeof(CmdYankPix));
}

void LedCtrl::YankNLed(unsigned int i, unsigned int count, unsigned char r, unsigned char g, unsigned char b, unsigned int stride, bool show)
{
    // printf("SetNLed(%d,%d,%d,%d,%d,%s)\n", i, count, r, g, b, show ? "show":"_");
    CmdYankPix p;
    p.cmd = CMD_YANK_N_PIXEL;
    if (show) p.cmd |= CMD_SHOW;
    p.pixelIdx = (0xf << 12) | i;
    p.count = count;
    p.stride = stride;
    p.red = r;
    p.grn = g;
    p.blu = b;
    sendRetry((char*) &p,sizeof(CmdYankPix));
}


void LedCtrl::SetLeds(unsigned int pxIdx, unsigned int count, uint32_t *pixcols, bool show)
{
    // printf("SetLeds(%d,%d,%s)\n", pxIdx, count, show ? "show":"_");
    CmdSetLedsHeader* p = (CmdSetLedsHeader*) buf;
    p->cmd = CMD_SET_PIXELS;
    if (show) p->cmd |= CMD_SHOW;
    p->pixelIdx = (0xf << 12) | pxIdx;
    p->count = count;
    unsigned char* pos = buf+sizeof(CmdSetLedsHeader);
    for (unsigned int i=0;i<count;i++)
    {
        uint32_t col = pixcols[i];
        *pos = (col>>16)&255;
        pos++;
        *pos = (col>>8)&255;
        pos++;
        *pos = (col)&255;
        pos++;
    }

    int total = pos-buf;
    sendRetry( (char*) buf, total);
}

bool LedCtrl::Sync(int timeout)
{
    printf("Sync(%d)\n", timeout);
    char cmd = CMD_SYNC;
    uint64_t start = GetStopwatch()/(1000*1000);
    if (sendRetry( &cmd, 1) != 1)
    {
        printf("sync send failed\n");
        return false;
    }
    // TODO potentially wait longer then timeout
    int amt = 0;
    while (amt < 1)
    {
        cmd = 0;
        int result = recv(sock,&cmd,1,MSG_WAITALL);  // wait for execution
        if (result < 0)
        {
            int err = errno;
            if (err == EAGAIN)
            {
                printf("  sync EAGAIN\n");
                result = 0;
            }
            else if (err == EINTR)
            {
                printf("  sync EINTR\n");
                result = 0;
            }
            else
            {
                printf("  sync recv returned errno %d (%s)\n", err, strerror(err));
                disconnect();
                return false;
            }
        }
        if (result == 0)
        {
            printf("  sync EMPTY\n");
        }
        //if (result) printf("received: %d\n", cmd);
        amt += result;
    }
    printf("sync %d DONE in %lums\n", cmd, GetStopwatch()/(1000*1000) - start);
    Delay(0);  // restart timing from here
    return true;
}

bool LedCtrl::Delay(int uSec)
{
    if (uSec < 0) return false;
    // printf("Delay(%d)\n",uSec);
    char cmd[5];
    uint32_t t = uSec;
    cmd[0] = CMD_DELAY;
    memcpy(&cmd[1],&t, sizeof(uint32_t));
    if (sendRetry( &cmd[0], sizeof(cmd)) != sizeof(cmd)) return false;
    return true;
}


bool LedCtrl::SyncDelay(int uSec, int syncTimeout)
{
    //Delay(0);
    Delay(uSec);
    uint64_t start = GetStopwatch()/1000;
    bool ret = Sync(syncTimeout);
    if (uSec < 0) return false;
    uint64_t now = GetStopwatch()/1000;
    if(now - start < (uint64_t) uSec)
    {
        usleep(now-start);
    }
    return ret;
}

bool LedCtrl::DelayUntil(int uSec)
{
    if (uSec < 0) return false;
    // printf("DelayUntil(%d)\n",uSec);
    char cmd[5];
    uint32_t t = uSec/1000;  // device resolution is in milliSeconds
    cmd[0] = CMD_DELAYUNTIL;
    memcpy(&cmd[1],&t, sizeof(uint32_t));
    if (sendRetry( &cmd[0], sizeof(cmd)) != sizeof(cmd)) return false;
    return true;
}


bool LedCtrl::ShowLeds()
{
    char buf;
    // printf("ShowLeds()\n");
    buf = CMD_SHOW;
    if (sendRetry( &buf, 1) != 1) return false;
    //flush(sock);
    //read(sock,buf,1);  // wait for execution
    return true;
}
