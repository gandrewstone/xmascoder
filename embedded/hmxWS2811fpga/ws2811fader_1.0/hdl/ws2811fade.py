import pdb
from myhdl import *


@block
def led_driver(clk, enable, rgb_data, read_data, led_num, bitstream, NUM_LEDS=1000, CLK_PER_PREFACE = 30000, CLK_PER_BIT = 125):
    CLK_HIGH0 = int(CLK_PER_BIT/4)
    CLK_HIGH1 = int(CLK_PER_BIT/2)
    ST_PREFACE = 0
    ST_DATA = 1

    preface = Signal(bool(0))
    rgb = Signal(intbv(0)[24:])

    interBitClk = Signal(intbv(0, min=0, max=CLK_PER_BIT+1))
    bitNum = Signal(intbv(0, min=0, max=25))

    state = Signal(bool(0))
    rebegin = Signal(bool(0))

    curLed = Signal(intbv(0, min=0, max=NUM_LEDS+1))

    interPrefaceClk = Signal(intbv(0, min=0, max=CLK_PER_PREFACE+1))

    @always(clk.posedge)
    def logic():
        nonlocal bitNum, interBitClk, state, interPrefaceClk

        if enable:
          if state == ST_PREFACE:
            if (interPrefaceClk < CLK_PER_PREFACE):
                interPrefaceClk.next = interPrefaceClk + 1
            else:
                interPrefaceClk.next = 0
                state.next = ST_DATA
          else:
            if (interBitClk < CLK_PER_BIT-1):
                interBitClk.next = interBitClk + 1
            else:
                interBitClk.next = 0
                if rebegin and bitNum==23:  # all done with the last LED!
                    state.next = ST_PREFACE
        else:
            interPrefaceClk.next = 0
            state.next = ST_PREFACE
            interBitClk.next = 0

    @always(clk.posedge)
    def genLedNum():
        nonlocal bitNum, interBitClk, led_num, curLed, enable

        if not enable:
            led_num.next = 0
            curLed.next = 0
            bitNum.next = 0
            read_data.next = 0
        else:
            if rebegin and state == ST_PREFACE:  # Once I've reset, then don't signal reset anymore
                rebegin.next = 0
            if interBitClk == CLK_PER_BIT-1: # at the end of a bit
                if bitNum == 22:  # get the next led colors early so it has time to load from RAM
                        if curLed < NUM_LEDS:
                            curLed.next = curLed + 1
                            led_num.next = curLed + 1
                        else:
                            led_num.next = 0
                            curLed.next = 0
                            rebegin.next = 1
                        read_data.next = 1
                else:
                    read_data.next = 0
                if bitNum == 23:
                    bitNum.next = 0
                else:
                    bitNum.next = bitNum + 1

            else:
                read_data.next = 0

            if interBitClk == CLK_PER_BIT-2:
                if bitNum == 23:
                            rgb.next = rgb_data # load up the next color

    @always_comb
    def genBitstream():
        if enable and state != ST_PREFACE:
            if rgb[23 - bitNum]:
                bitstream.next = (interBitClk <= CLK_HIGH1)
            else:
                bitstream.next = (interBitClk <= CLK_HIGH0)
        else:
            bitstream.next = 0

    @always(clk.posedge)
    def genBitstreamNosig():
        if enable and state != ST_PREFACE:
            if rgb[bitNum]:
                bitstream = (interBitClk <= CLK_HIGH1)
            else:
                bitstream = (interBitClk <= CLK_HIGH0)
        else:
            bitstream = 0

    return logic, genBitstream, genLedNum

from random import randrange


@block
def test_led():

    count = 0

    LedTestData = [0xAAAAAA] * 1024 #range(1,1024)
    clk = Signal(bool(0))
    enable = Signal(bool(0))
    bitstream = Signal(bool(0))
    rgb_data = Signal(intbv(0)[24:])
    led_num = Signal(intbv(0, min=0, max=1024))
    read_data = Signal(bool(0))

    inst = led_driver(clk, enable, rgb_data, read_data, led_num, bitstream, NUM_LEDS=3, CLK_PER_PREFACE = 100, CLK_PER_BIT = 20)

    @always(delay(1))
    def clkgen():
        clk.next = not clk

    @always(clk.posedge)
    def genLedData():
        if read_data:
            rgb_data.next = LedTestData[led_num]
        pass # print("logged %d" % inst.bitClock)

    @always(clk.negedge)
    def stimulus():
        nonlocal count
        if (count<10000):
          enable.next = 1 # randrange(2)
        elif count < 20000:
            enable.next = 0
        else:
            enable.next = 1
        count += 1

    return inst, clkgen, stimulus, genLedData


def Test():
    #tb = traceSignals(test_led)
    # tb.filename="test.vcd"
    sim = test_led()
    sim.config_sim(trace=True, filename="test")
    sim.run_sim(100000)

    clk = Signal(bool(0))
    enable = Signal(bool(0))
    bitstream = Signal(bool(0))
    read_data = Signal(bool(0))
    rgb_data = Signal(intbv(0)[24:])
    led_num = Signal(intbv(0, min=0, max=1024))
                      
    ld = led_driver(clk, enable, rgb_data, read_data, led_num, bitstream)
    ld.convert(hdl="Verilog", name="led_driver")
    pdb.set_trace()
