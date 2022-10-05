#!/bin/bash

#ps -ef |grep "alacritty --dimensions 30 6 --position 50 50 --title HOTSPOT -e /home/ben/.config/i3/scripts/hotspot.sh" |awk '{print $2}' |xargs kill
EXIST=$(pgrep -c -f "alacritty .* --title HOTSPOT" )
if [[ $EXIST -gt 1 ]]; then
    exit 0
fi

hotspot=$(ip addr | grep "inet .* wlan1")
if [[ -z "$hotspot" ]]; then
    #	# off -> on
    #	echo 睊  
    #	sudo clear && \
    #	read -t 5 -p "`echo $' 睊    \nTurn on Hotspot? [y/n]'`" checking
    echo 睊  
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
    #	# on -> off
    #	echo    睊
    #	sudo clear && \
    #
    #if [[ $EUID -ne 0 ]]; then
    #  echo "You must run this with superuser priviliges.  Try \"sudo ./dkms-install.sh\"" 2>&1
    #  exit 1
    #else
    #  echo "About to run dkms install steps..."
    #fi
    ############################################################################################
    echo    睊
    read -t 5 -p "Close Hotspot? [y/n]" checking
    checking=${checking:-"n"}
    if [[ $checking == "y" ]]; then
        sudo killall create_ap &&\
            sudo ip link set wlan1  down &&\
            sudo iw dev wlan1 del &&\
            notify-send 'Hotspot' 'off' -t 700
    fi
fi
