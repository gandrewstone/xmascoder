
ROUTER:=192.168.0.4

define chop1
$(shell echo "$(1)" | cut -c 2-)
endef

all:

FORCE:

netrestart: FORCE
	ssh root@$(ROUTER) "/etc/init.d/network restart"

installkey: FORCE
	cat ~/.ssh/id_rsa.pub | ssh root@$(ROUTER) "cat >> /etc/dropbear/authorized_keys"

download: dwireless ddhcp dnetwork dfirewall
	echo done

dwireless: FORCE
	scp root@$(ROUTER):/etc/config/$(call chop1,$@) .

ddhcp: FORCE
	scp root@$(ROUTER):/etc/config/$(call chop1,$@) .

dnetwork: FORCE
	scp root@$(ROUTER):/etc/config/$(call chop1,$@) .

dfirewall: FORCE
	scp root@$(ROUTER):/etc/config/$(call chop1,$@) .


upload: wireless dhcp network firewall
	echo done

wireless: FORCE
	scp $@ root@$(ROUTER):/etc/config

dhcp: FORCE
	scp $@ root@$(ROUTER):/etc/config

network: FORCE
	scp $@ root@$(ROUTER):/etc/config

firewall: FORCE
	scp $@ root@$(ROUTER):/etc/config
