#!/bin/bash
BATIFBAT=$(acpi -b |grep -o 'Discharging')
BATREMAIN=$(/usr/bin/acpi -b | grep -E -o '[0-9][0-9]?[0-9]?%')
BATTIME=$(/usr/bin/acpi -b | grep -E -o '([0-9]{2}:){2}[0-9]{2}')
TIMEPER5=$(( 10#$(/usr/bin/date +%M) % 5 ))

[[ -n "$BATIFBAT" ]] && \
	if ([[ "$BATREMAIN" -lt 10 ]] || [[ "$BATTIME" < 00:10:00 ]]) ; then
		/usr/bin/notify-send "low battery" "$BATREMAIN $BATTIME" -u critical
		#/usr/bin/canberra-gtk-play -f /home/ben/.config/i3/Low-battery-sound.wav
		/usr/bin/canberra-gtk-play -f /home/ben/.config/i3/power-unplug-battery-low.wav
	elif ([[ "$BATREMAIN" -lt 25 ]] || [[ "$BATTIME" < 00:25:00  ]]) && \
	[[ "$TIMEPER5" == 0 ]] ; then
		/usr/bin/notify-send "low battery" "$BATREMAIN $BATTIME"
fi

exit 0
