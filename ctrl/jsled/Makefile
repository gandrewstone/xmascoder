SHELL=/bin/bash

OS = LINUX
#OS = MACOSX
#OS = WINDOWS

BOARD := NONE
# BOARD := CHIP

#LEDTGT := sdl
#LEDTGT := teensy
LEDTGT := esp32

HEADERS=$(wildcard *.h)

ifdef SIM
CROSS :=
PLAT  := x64
LEDTGT := sdl
LIBS := -lusb
#CC :=/me/git/v8/v8/third_party/llvm-build/Release+Asserts/bin/clang++ -fPIC -Werror -std=c++11
##LINK:=/me/git/v8/v8/third_party/llvm-build/Release+Asserts/bin/clang++ -pthread -pie -Werror -std=c++11
#CC:=g++ -O0 -g -fPIC -Werror -std=c++11
CC:=g++ -O2 -fPIC -Werror -std=c++11
LINK:=g++ -pie -Werror -std=c++11
V8_LIBS:=$(shell echo /me/git/v8/v8/out.gn/x64.release/obj/{libv8_{base,libbase,external_snapshot,libplatform,libsampler},third_party/icu/libicu{uc,i18n},src/inspector/libinspector}.a)
OUTDIR:=sim
else

ifeq ($(BOARD), CHIP)
CVER := 6
OUTDIR:=arm
else
OUTDIR:=bin
endif
endif

ifeq ($(BOARD), CHIP)
PLAT := arm
CROSS :=arm-linux-gnueabihf-
LIBS := -L /me/hw/chip -lusb-0.1
STRIP := $(CROSS)strip
CC:=$(CROSS)g++-$(CVER) -O0 -g -fPIC -std=c++11
CC:=$(CROSS)g++-$(CVER) -O2 -fPIC -std=c++11
LINK:=$(CROSS)g++-$(CVER) -pie -std=c++11
#CC :=/me/git/v8/v8/third_party/llvm-build/Release+Asserts/bin/clang++ -pie --target=arm-linux-gnueabihf -Werror -nostdlib++ --sysroot=../../build/linux/debian_stretch_arm-sysroot -std=c++11
#LINK:=/me/git/v8/v8/third_party/llvm-build/Release+Asserts/bin/clang++ -pie --target=arm-linux-gnueabihf -Werror -nostdlib++ --sysroot=../../build/linux/debian_stretch_arm-sysroot -std=c++11
V8_LIBS:=$(shell echo /me/git/v8/v8/out.gn/arm.release/obj/{libv8_{base,libbase,external_snapshot,libplatform,libsampler},third_party/icu/libicu{uc,i18n},src/inspector/libinspector}.a)
else
STRIP:=strip
CC:=g++ -O2 -fPIC -Werror -std=c++11
LINK:=g++ -pie -Werror -std=c++11
# apt install libusb-0.1
ifeq ($(LEDTGT), teensy)
LIBS := -L /lib/x86_64-linux-gnu /lib/x86_64-linux-gnu/libusb-0.1.so.4
endif
V8_LIBS:=$(shell echo /me/git/v8/v8/out.gn/x64.release/obj/{libv8_{base,libbase,external_snapshot,libplatform,libsampler},third_party/icu/libicu{uc,i18n},src/inspector/libinspector}.a)
endif

ifeq ($(LEDTGT), esp32)
LIBS += -lavahi-client -lavahi-common
endif


PROG = jsLed
#xmas2017

# To set up Ubuntu Linux to cross compile for Windows:
#
#    apt-get install mingw32 mingw32-binutils mingw32-runtime
#
# Just edit the variable above for WINDOWS, then use "make" to build rawhid.exe

ifeq ($(OS), LINUX)
TARGET = $(OUTDIR)/$(PROG)

#CFLAGS = -Wall -O2 -DOS_$(OS)
CFLAGS = -Wall -g -O0 -DOS_$(OS)
else ifeq ($(OS), MACOSX)
TARGET = $(OUTDIR)/$(PROG).dmg
SDK = /Developer/SDKs/MacOSX10.5.sdk
ARCH = -mmacosx-version-min=10.5 -arch ppc -arch i386
CC = g++
STRIP = strip
CFLAGS = -Wall -O2 -DOS_$(OS) -isysroot $(SDK) $(ARCH)
LIBS := $(ARCH) -Wl,-syslibroot,$(SDK) -framework IOKit -framework CoreFoundation
else ifeq ($(OS), WINDOWS)
TARGET = $(OUTDIR)/$(PROG).exe
CC = i586-mingw32msvc-gcc
STRIP = i586-mingw32msvc-strip
CFLAGS = -Wall -O2 -DOS_$(OS)
LIBS := -lhid -lsetupapi
endif

OBJS += $(OUTDIR)/$(PROG).o $(OUTDIR)/xmas2021.o $(OUTDIR)/ledctrl.o $(OUTDIR)/deviceFinder.o

ifeq ($(LEDTGT), teensy)
OBJS += $(OUTDIR)/hid.o
endif

ifeq ($(LEDTGT), sdl)
LIBS += -lSDL2
endif

#V8_LIB_DIR:=/me/git/v8/v8/out.gn/$(PLAT).release
#V8_LIBS:= $(V8_LIB_DIR)/obj/
#V8_LIBS:= -L$(V8_LIB_DIR)/obj -L$(V8_LIB_DIR)/obj/third_party/icu -lv8_base -lv8_libsampler -lv8_nosnapshot -lv8_libplatform -lv8_libbase -licui18n -licuuc -licudata -pthread -ldl -lc++
#V8_LIBS:= $(V8_LIB_DIR)/obj/libv8_base.a $(V8_LIB_DIR)/obj/libv8_libsampler.a $(V8_LIB_DIR)/obj/libv8_nosnapshot.a $(V8_LIB_DIR)/obj/libv8_libplatform.a $(V8_LIB_DIR)/obj/libv8_libbase.a $(V8_LIB_DIR)/obj/third_party/icu/libicui18n.a $(V8_LIB_DIR)/obj/third_party/icu/libicuuc.a -pthread

#V8_LIBS:= -L$(V8_LIB_DIR) -lv8_libbase -lv8_platform

LIBS += -Wl,--start-group $(V8_LIBS) -Wl,--end-group -ldl -lpthread -lrt
#LIBS += -Wl,--start-group $(V8_LIBS) -Wl,--end-group -l libdl.a libpthread.a librt.a

# LIBS += -Wl,--fatal-warnings -fPIC -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread -Wl,--as-needed -fuse-ld=lld -Wl,--icf=all -m64 -Werror -nostdlib++ --sysroot=../../build/linux/debian_stretch_amd64-sysroot -L../../build/linux/debian_stretch_amd64-sysroot/lib/x86_64-linux-gnu -Wl,-rpath-link=../../build/linux/debian_stretch_amd64-sysroot/lib/x86_64-linux-gnu -L../../build/linux/debian_stretch_amd64-sysroot/usr/lib/x86_64-linux-gnu -Wl,-rpath-link=../../build/linux/debian_stretch_amd64-sysroot/usr/lib/x86_64-linux-gnu -Wl,-rpath-link=. -Wl,--disable-new-dtags -Wl,-O1 -Wl,--gc-sections -o "./v8_hello_world" -Wl,--start-group @"./v8_hello_world.rsp"  -Wl,--end-group   -ldl -lpthread -lrt 
CFLAGS += -I /me/git/v8/v8 -I /me/git/v8/v8/include

all: $(TARGET)

$(OUTDIR)/$(PROG): $(OBJS)
	$(LINK) $(LFLAGS) -o $@ $(OBJS) $(LIBS)
#	$(STRIP) $@

$(PROG).exe: $(PROG)
	cp $(PROG) $(PROG).exe

$(PROG).dmg: $(PROG)
	mkdir tmp
	cp $(PROG) tmp
	hdiutil create -ov -volname "Raw HID Test" -srcfolder tmp $(PROG).dmg


$(OUTDIR)/ledctrl.o: ledctrl$(LEDTGT).cpp $(HEADERS)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OUTDIR)/%.o: %.cpp $(HEADERS) 
	$(CC) $(CFLAGS) -c -o $@ $<

$(OUTDIR)/%.o: %.cc $(HEADERS) 
	$(CC) $(CFLAGS) -c -o $@ $<


$(OUTDIR)/hid.o: hid_$(OS).cpp hid.h $(HEADERS) 
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	(cd $(OUTDIR); rm -f *.o $(PROG) $(PROG).exe $(PROG).dmg)
	rm -rf tmp

