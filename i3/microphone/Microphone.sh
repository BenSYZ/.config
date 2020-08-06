#!/bin/bash

mymicrophone_file=~/.config/i3/mymicrophone_config/flag
mymicrophone=$(< $mymicrophone_file)
#echo $mymicrophone

if [ "$mymicrophone" -eq 1 ]
then
	echo 0 > $mymicrophone_file
	echo 1
	#notify-send -h int:transient:1 "Hello" "World"
	notify-send -h int:transient:1 'Microphone' 'off' -t 700
	amixer set Capture nocap
else
	echo 1 > $mymicrophone_file
	echo 0
	notify-send -h int:transient:1 'Microphone' 'on' -t 700
	amixer set Capture cap
fi
