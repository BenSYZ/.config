#!/bin/bash
BATTINFO=`acpi -b`
#if [[ `echo $(/usr/bin/acpi -b) | grep Discharging` && `echo $(/usr/bin/acpi -b) | cut -f 4 -d " " | cut -f 1 -d "%"` -le 15 || `echo $BATTINFO | cut -f 5 -d " "` < 00:15:00 ]] ; then
if [[ `echo $(/usr/bin/acpi -b) | grep Discharging` &&  `echo $BATTINFO | cut -f 5 -d " "` < 00:40:00 ]] ; then
	/usr/bin/notify-send "low battery" "$(/usr/bin/acpi -b)"
	#DISPLAY=:0.0 su $USER -c "/usr/bin/notify-send 'low battery' '$(acpi -b)'"
	#echo "* * * * * /home/ben/.config/i3/BatteryNotification.sh" >> /home/ben/crontab
fi
#if [[ `echo $(/usr/bin/acpi -b) | grep Discharging` && `echo $(/usr/bin/acpi -b) | cut -f 4 -d " " | cut -f 1 -d "%"` -le 15 || `echo $BATTINFO | cut -f 5 -d " "` <00:05:00 ]] ; then
if [[ `echo $(/usr/bin/acpi -b) | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` <00:20:00 ]] ; then
	/usr/bin/notify-send "Going to shutdown" "Using 'shutdonw -c' to cancel"
	/usr/bin/sync
	/usr/bin/shutdown
	sleep 55
	/usr/bin/sync
	#DISPLAY=:0.0 su $USER -c "/usr/bin/notify-send 'low battery' '$(acpi -b)'"
fi
#https://faq.i3wm.org/question/1730/warning-popup-when-battery-very-low.1.html

