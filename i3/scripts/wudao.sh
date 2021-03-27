#!/bin/sh
read tobetranslate
if [ "$(echo $tobetranslate |wc -w)" -lt 10 ]; then
	for i in `echo "$tobetranslate" |sed 's/[()\r]//g' |sed 's/ -/ /g'`
	do
	wd $i | sed -r 's/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g'| xargs -0 notify-send
	done
else 
	echo 'Too much words(<10)' |xargs -0 notify-send
fi
