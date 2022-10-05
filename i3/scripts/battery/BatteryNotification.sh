#!/bin/bash

BATIFBAT=$(acpi -b |grep 'Battery 0'|grep -o 'Discharging') # 'Battery 0' bluetooth keyboard
BATREMAIN=$(/usr/bin/acpi -b|grep 'Battery 0' | grep -E -o '[0-9][0-9]?[0-9]?%')
BATREMAIN=${BATREMAIN%?}
BATTIME=$(/usr/bin/acpi -b|grep 'Battery 0' | grep -E -o '([0-9]{2}:){2}[0-9]{2}')
BATTIME=${BATTIME:-'05:00:00'} #Battery 0: Discharging, 99%, discharging at zero rate - will never fully discharge.
TIMEPER5=$(( 10#$(/usr/bin/date +%M) % 5 ))


[ -n "$BATIFBAT" ] && \
    if [ "$BATREMAIN" -lt 10 ] || [[ "$BATTIME" < 00:10:00 ]] ; then
        #echo $(date) >> /tmp/battery_info
        #echo $(acpi -b) >> /tmp/battery_info
        /usr/bin/notify-send "low battery" "$BATREMAIN $BATTIME" -u critical
        #/usr/bin/canberra-gtk-play -f /home/ben/.config/i3/Low-battery-sound.wav
        /usr/bin/canberra-gtk-play -f /home/ben/.config/i3/scripts/battery/power-unplug-battery-low.wav
    elif [ "$BATREMAIN" -lt 25 ] || [[ "$BATTIME" < 00:25:00  ]] && \
        [ "$TIMEPER5" -eq 0 ] ; then
            /usr/bin/notify-send "low battery" "$BATREMAIN $BATTIME"
    fi

exit 0
