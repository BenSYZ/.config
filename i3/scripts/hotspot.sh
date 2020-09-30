#!/bin/bash
#if [[ "$Flag" -eq 1 ]]; then
#		./CHotspot.sh
#		notify-send -h int:transient:1 'Hotspot' 'off' -t 700
#		echo 0 > $MyHotspotFlag
#
#else
#	echo 0
#	read -p "Turn on Hotspot? [y/n]" checking -t 3
#	checking=${checking:-"n"}
#	if [[ $checking == "y" ]]; then
#		./OHotspot.sh
#		notify-send -h int:transient:1 'Hotspot' 'on' -t 700
#		echo 1 > $MyHotspotFlag
#	fi
#fi
#
#
#hotspot=$(ip addr | grep "inet .* wlan1")

# when have special meaning
# sed {: \{
# sed (: \(, no matter if it's a group
# sed ?: \?
# sed [: [

if [ -z "$hotspot" ]; then
	# off -> on
	sudo echo 睊   
	read -t 5 -p "Turn on Hotspot? [y/n]" checking
	checking=${checking:-"n"}
	if [[ $checking == "y" ]]; then
		sudo iw dev wlp5s0 interface add wlan1 type __ap &&\
		sudo ip link set dev wlan1 address 22:33:44:dd:66:00 &&\
		sudo ip link set  wlan1 up &&\
		sudo create_ap wlan1 wlp5s0 ほんま・めいこ HonmaMeiko --daemon --no-virt &&\
		notify-send 'Hotspot' 'on' -t 700
	fi
else
	# on -> off
	sudo echo    睊
	sudo read -t 3 -p "Close Hotspot? [y/n]" checking
	checking=${checking:-"n"}
	if [[ $checking == "y" ]]; then
		sudo killall create_ap &&\
		sudo ip link set wlan1  down &&\
		sudo iw dev wlan1 del &&\
		notify-send 'Hotspot' 'off' -t 700
		sleep 10
	fi
fi
