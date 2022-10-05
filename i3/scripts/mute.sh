#!/bin/bash
amixer set Master toggle
canberra-gtk-play -i audio-volume-change -d 'changeVolume'
volume=$( amixer | grep 'Master' -A 5|sed -n 's/.*\[\([0-9][0-9]\?[0-9]\?%\)\] \[\(.*\)\]/\1 \2/p')
case $volume in 
    *"off"*)
        notify-send 'volume' 'off' -t 800
        ;;
    *"on"*)
        notify-send 'volume ' "$volume"  -t 800
esac
