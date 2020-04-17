#!/bin/bash
MyHotspotFlag=~/.config/i3/MyHotspot/flag
Flag=$(< $MyHotspotFlag)
#echo $mymicrophone

if [ "$Flag" -eq 1 ]
then
	echo 1
	~/.config/i3/MyHotspot/CHotspot.sh
	notify-send -h int:transient:1 'Hotspot' 'off' -t 700
	echo 0 > $MyHotspotFlag

else
	echo 0
	~/.config/i3/MyHotspot/OHotspot.sh
	notify-send -h int:transient:1 'Hotspot' 'on' -t 700
	echo 1 > $MyHotspotFlag
fi
