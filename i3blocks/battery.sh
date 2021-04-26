#!/bin/bash

BAT=$(acpi -b |grep 'Battery 0' | grep -E -o '[0-9][0-9]?[0-9]?%')
#BAT='9%'
#CHARGING='Discharging'

CHARGING=$(acpi -b|grep 'Battery 0' |grep -o -E '(Not c|Disc|C)harging')
case "$CHARGING" in 
	# Using battery
	"Discharging" )
		if [[ ${BAT%?} -lt 10 ]];then
		    #echo '<span color="#FFFFFF">  '"${BAT%?}"'</span>'
		    #echo '<span background="#FF8000" color="#FFFFFF" >   '"${BAT}"'</span>'
		    echo '<span  color="#FF8000" ><b>   '"${BAT}"'</b></span>'
		    #echo "#FF8000"
		elif [[ ${BAT%?} -lt 38 ]];then
		    #echo "<span color='#FFFFFF'>\uf243</span> ${BAT%?}"
		    echo '<span color="#FFFFFF">  '"${BAT}"'</span>'
		elif [[ ${BAT%?} -lt 63 ]];then
		    #echo "<span color='#FFFFFF'>\uf242</span> ${BAT%?}"
		    echo '<span color="#FFFFFF">  '"${BAT}"'</span>'
		elif [[ ${BAT%?} -lt 88 ]];then
		    #echo "<span color='#FFFFFF'>\uf241</span> ${BAT%?}"
		    echo '<span color="#FFFFFF">  '"${BAT}"'</span>'
		else
			#echo "<span color='#FFFFFF'>\uf240</span> ${BAT%?} %"
		    echo '<span color="#FFFFFF">  '"${BAT}"'</span>'
		fi
		;;
	# Charging
	"Charging" )
		echo "<span color='yellow'>🗲 </span>$BAT"
		;;

	# Full
	"Not charging" )
		echo '<span size="x-large" color="#FFC33B"> </span>'
		;;
esac
# 
# 
# # Full and short texts
# echo "$BAT"
# #echo "BAT: $BAT"
# 
# # Set urgent flag below 5% or use orange below 20%
# [ ${BAT%?} -le 5 ] && exit 33
# [ ${BAT%?} -le 20 ] && echo "#FF8000"
# 
# exit 0
