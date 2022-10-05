#!/bin/bash
# ##card='wlp0s20f0u2'
# ##echo "link"
# ##sudo ip link set $card up
# ##sudo wpa_supplicant -i $card -c /etc/wpa_supplicant/wpa_supplicant-wlp0s20f0u3.conf -B
# ##sudo dhcpcd $card
# #
# sudo iw dev wlp5s0 interface add wlan1 type __ap &&\
# sudo ip link set dev wlan1 address 22:33:44:dd:66:00 &&\
# sudo ip link set  wlan1 up &&\
# sudo create_ap wlan1 wlp5s0 ほんま・めいこ HonmaMeiko --daemon --no-virt
# #
# #
# #
# #
# #
# ##sudo iw dev wlp0s20f0u4 interface add wlan1 type __ap &&\
# ##sudo ip link set dev wlan1 address 22:33:44:dd:66:00 &&\
# ##sudo ip link set  wlan1 up &&\
# ##sudo create_ap wlan1 wlp0s20f0u4 ほんま・めいこ HonmaMeiko --daemon --no-virt
# #iptables -t nat -A POSTROUTING -o internet0 -j MASQUERADE
# #iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
# #iptables -A FORWARD -i net0 -o internet0 -j ACCEPT
# #
# #iptables -I INPUT -p udp --dport 67 -i net0 -j ACCEPT
# #iptables -I INPUT -p udp --dport 53 -s 192.168.123.0/24 -j ACCEPT
# #iptables -I INPUT -p tcp --dport 53 -s 192.168.123.0/24 -j ACCEPT
