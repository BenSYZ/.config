#!/bin/bash
BATTINFO=$(/usr/bin/acpi -b)
BATTIFBAT=$(echo "$BATTINFO" | grep "Discharging")
BATTREMAIN=$(echo "$BATTINFO" | cut -f 4 -d " " | cut -f 1 -d "%" )
BATTTIME=$(echo "$BATTINFO" | cut -f 5 -d " ")
#Battery 0: Discharging, 31%, 01:40:53 remaining
#https://faq.i3wm.org/question/1730/warning-popup-when-battery-very-low.1.html
TIMEPER5=$(( 10#$(/usr/bin/date +%M) % 5 ))

#if [[ $( echo $BATTINFO | grep Discharging ) ]]; then
#	if [[ $(echo $BATTINFO | cut -f 4 -d " " | cut -f 1 -d "%" ) -lt 10 ]] || \
#		[[ $(echo $BATTINFO | cut -f 5 -d " ") < 00:10:00  ]] ; then
#		/usr/bin/notify-send "low battery" "$BATTINFO" -u critical
#		#/usr/bin/canberra-gtk-play -f /home/ben/.config/i3/Low-battery-sound.wav
#		/usr/bin/canberra-gtk-play -f /home/ben/.config/i3/power-unplug-battery-low.wav
#		#DISPLAY=:0.0 su $USER -c "/usr/bin/notify-send 'low battery' '$(acpi -b)'"
#	elif [[ $(echo $BATTINFO |  cut -f 4 -d " " | cut -f 1 -d "%") -lt 25 ]] || \
#		[[ $(echo $BATTINFO | cut -f 5 -d " ") < 00:25:00  ]]            && \
#		[[ $(echo $TIMEPER5) == 0 ]] ; then
#		/usr/bin/notify-send "low battery" "$BATTINFO"
#		#DISPLAY=:0.0 su $USER -c "/usr/bin/notify-send 'low battery' '$(acpi -b)'"
#		#echo "* * * * * /home/ben/.config/i3/BatteryNotification.sh" >> /home/ben/crontab
#	fi
#fi

if [[ "$BATTIFBAT" ]] && \
	([[ "$BATTREMAIN" -lt 10 ]] || [[ "$BATTTIME" < 00:10:00 ]]) ; then
		/usr/bin/notify-send "low battery" "$BATTINFO" -u critical
		#/usr/bin/canberra-gtk-play -f /home/ben/.config/i3/Low-battery-sound.wav
		/usr/bin/canberra-gtk-play -f /home/ben/.config/i3/power-unplug-battery-low.wav
elif [[ "$BATTIFBAT" ]] && \
	([[ "$BATTREMAIN" -lt 25 ]] || [[ "$BATTTIME" < 00:25:00  ]]) && \
	[[ "$TIMEPER5" == 0 ]] ; then
		/usr/bin/notify-send "low battery" "$BATTINFO"
fi
