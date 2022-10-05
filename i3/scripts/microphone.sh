#!/bin/bash
capture=$(amixer | grep "'Capture'" -A 4|sed -n "s/.*\[\([0-9][0-9]\?[0-9]\?%\)\] \[\(.*\)\]/\1 \2/p")
case "$capture" in 
    *"off"*)
        #notify-send 'Microphone' 'on' -t 700
        amixer set Capture cap
        ;;
    *"on"*)
        #notify-send 'Microphone' 'off' -t 700
        amixer set Capture nocap
esac
pkill -SIGRTMIN+11 i3blocks
