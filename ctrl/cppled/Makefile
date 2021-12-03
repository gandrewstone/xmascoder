
OS = LINUX
#OS = MACOSX
#OS = WINDOWS

ifdef SIM
CROSS :=
LEDTGT := sdl
LIBS := -lusb
else
LEDTGT := teensy
CROSS :=arm-linux-gnueabihf-
LIBS = -L /me/hw/chip -lusb-0.1
endif

PROG = xmas2018

# To set up Ubuntu Linux to cross compile for Windows:
#
#    apt-get install mingw32 mingw32-binutils mingw32-runtime
#
# Just edit the variable above for WINDOWS, then use "make" to build rawhid.exe



ifeq ($(OS), LINUX)
TARGET = $(PROG)
CC = $(CROSS)g++ -std=c++11
STRIP = strip
#CFLAGS = -Wall -O2 -DOS_$(OS)
CFLAGS = -Wall -g -O0 -DOS_$(OS)
else ifeq ($(OS), MACOSX)
TARGET = $(PROG).dmg
SDK = /Developer/SDKs/MacOSX10.5.sdk
ARCH = -mmacosx-version-min=10.5 -arch ppc -arch i386
CC = g++
STRIP = strip
CFLAGS = -Wall -O2 -DOS_$(OS) -isysroot $(SDK) $(ARCH)
LIBS := $(ARCH) -Wl,-syslibroot,$(SDK) -framework IOKit -framework CoreFoundation
else ifeq ($(OS), WINDOWS)
TARGET = $(PROG).exe
CC = i586-mingw32msvc-gcc
STRIP = i586-mingw32msvc-strip
CFLAGS = -Wall -O2 -DOS_$(OS)
LIBS := -lhid -lsetupapi
endif

OBJS += $(PROG).o ledctrl.o hid.o

ifeq ($(LEDTGT), sdl)
LIBS += -lSDL2
endif

all: $(TARGET)

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) -o $(PROG) $(OBJS) $(LIBS)
	# $(STRIP) $(PROG)

$(PROG).exe: $(PROG)
	cp $(PROG) $(PROG).exe

$(PROG).dmg: $(PROG)
	mkdir tmp
	cp $(PROG) tmp
	hdiutil create -ov -volname "Raw HID Test" -srcfolder tmp $(PROG).dmg


ledctrl.o: ledctrl$(LEDTGT).cpp
	$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.cpp
	$(CC) $(CFLAGS) -c -o $@ $<


hid.o: hid_$(OS).cpp hid.h
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f *.o $(PROG) $(PROG).exe $(PROG).dmg
	rm -rf tmp

