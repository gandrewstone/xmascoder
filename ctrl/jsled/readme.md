# javascript LED driver


## Dependencies

### V8




## Build

make



## Run

# route ctrl packets quickly (doesn't seem to matter much)
sudo iptables -A PREROUTING -t mangle -p udp --sport 1225 -j TOS --set-tos Minimize-Delay

bin/jsLed [board name]
x
