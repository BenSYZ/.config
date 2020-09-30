#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9][0-9]?[0-9]?%')

CHARGING=$(acpi -b |grep -o 'Discharging')
[[ -n $CHARGING ]] && if [[ ${BAT%?} < 10 ]];then
            echo "<span>  ${BAT%?}</span>"
	    echo "#FF8000"
        elif [[ ${BAT%?} < 38 ]];then
            #echo "<span color='#FFFFFF'>\uf243</span> ${BAT%?}"
            echo "<span color='#FFFFFF'>  ${BAT%?}</span>"
        elif [[ ${BAT%?} < 63 ]];then
            #echo "<span color='#FFFFFF'>\uf242</span> ${BAT%?}"
            echo "<span color='#FFFFFF'>  ${BAT%?}</span>"
	elif [[ ${BAT%?} < 88 ]];then
            #echo "<span color='#FFFFFF'>\uf241</span> ${BAT%?}"
            echo "<span color='#FFFFFF'>  ${BAT%?}</span>"
	else
		#echo "<span color='#FFFFFF'>\uf240</span> ${BAT%?} %"
		echo "<span color='#FFFFFF'>  ${BAT%?} %</span>"
	fi


CHARGING=$(acpi -b |grep -o 'Charging')
[[ -n "$CHARGING" ]] && echo "<span color='yellow'>🗲 </span>$BAT"

CHARGING=$(acpi -b |grep -o 'Not charging')
[[ -n "$CHARGING" ]] && echo "🙂"


# Full and short texts
echo "$BAT"
#echo "BAT: $BAT"

# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -le 5 ] && exit 33
[ ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0
