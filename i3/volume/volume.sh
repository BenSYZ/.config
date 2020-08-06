#!/bin/bash

myvolume_file=~/.config/i3/myvolume_config/flag
myvolume=$(< $myvolume_file)

if [ $((myvolume == 1)) '=' 1 ]
then
	amixer set Master toggle
	myvolume=$((myvolume - 1))
	echo $myvolume > $myvolume_file
else
	amixer -D pulse set Master 1+ toggle
	myvolume=$((myvolume + 1))
	echo $myvolume > $myvolume_file
fi
