# OpenWRT hacking

default reset IP address is 192.168.1.1

ssh-copy-id root@192.168.1.1

If you put OpenWRT on a child subnet, you need to route between them by setting up a hardcoded static route.
For example:

```
                         WAN
                          |
           ------------192.168.1.1 (your router)---------------------
           |                                                        |
  -----OpenWRT (192.168.1.199 for example)-----          your computer (192.168.1.10)
  |                                           |
192.168.3.0                               192.168.2.0
```

The problem here is probably that the .2 and the .3 networks are not subnets of the .1 (they are all /24), so we need to manually route.

## Routing between local subnets

If you have 2 subnets underneath your main subnet, you need to go to the routers of the 2 subnets and put up routes between them:
(in your OpenWRT device AND the other 2 devices via their web interface)


(run in openWRT to route to office)
sudo ip route add 192.168.1.0/24 via 192.168.0.2

### Show routes

route -n

**what is the meaning of 0.0.0.0 as a gateway?**
*It means that the network is locally connected on that interface and no more hops are needed to get to it. In the Internet Protocol version 4 the address 0.0. 0.0 is a non-routable meta-address used to designate an invalid, unknown or non applicable target.*

### Add a route

The devices connected to OpenWRT will automatically route properly in this configuration to your computer because they forward to the default gateway which is on the 192.168.1.0/24 network.

But your computer won't route to the .3 and the .2 subnets because by default it will go up to the WAN.

On your computer add:
sudo ip route add 192.168.3.0/24 via 192.168.1.199
sudo ip route add 192.168.2.0/24 via 192.168.1.199


## Packages

opkg update

### Emacs clone
opkg install zile


## Config files

located at /etc/config

### Key files

Actually, may be best to do:
/etc/init.d/qos stop
/etc/init.d/firewall stop

#### Firewall

zile /etc/config/firewall
service firewall restart

#### Wireless

*Change wireless channel*: 'iw phy' to find supported channels, then:

zile /etc/config/wireless
wifi reload


### Cheat Sheet

#### Copy relevant config files
scp root@192.168.1.199:/etc/config/{network,wireless,dhcp,firewall} .

#### OpenWRT command line tools

##### Show supported channels
iw phy
##### Show other radios channels 
iw dev wlan1 scan | grep primary



### Troubleshooting

#### 400ms Sync Times

Interference from another radio



