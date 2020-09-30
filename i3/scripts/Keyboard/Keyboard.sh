#!/bin/bash
FlagFile=~/.config/i3/Keyboard/flag
Flag=$(< $FlagFile)
#echo $mymicrophone

if [ "$Flag" -eq 1 ]
then
	echo 1
	xmodmap ~/.xmodmap2
	notify-send -h int:transient:1 'Keyboard' 'QWERT' -t 700
	echo 0 > $FlagFile

else
	# qwert to colemak
	echo 0
	xmodmap ~/.xmodmap1
	notify-send -h int:transient:1 'Keyboard' 'COLEMAK' -t 700
	echo 1 > $FlagFile
fi
