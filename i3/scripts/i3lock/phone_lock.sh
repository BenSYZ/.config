#!/usr/bin/bash

lock(){
	xset s 7 -b

	scrot -z -e 'mv $f /tmp/i3lock.png'
	convert /tmp/i3lock.png -blur 5x10 /tmp/i3lock.png
	i3lock -i /tmp/i3lock.png -n -c '#000000' -o '#191d0f' -w '#572020' -e
	rm /tmp/i3lock.png
	# -l '#ffffff' waiting

	xset s off
}


while true
do
	idletime=$(xprintidle)
	#echo $idletime
	threshold=5000
	if [ "$idletime" -gt "$threshold" ]; then
	#echo $idletime > 5000
	# no activity then test
		WIFINAME=$(iwconfig wlp5s0 | sed -n 's/.*ESSID:"\(.*\)"/\1/p')
		#echo $WIFINAME
		if [ $WIFINAME = 'Raspberrypi' ]; then
			pinginfo=$(ping -c 1 -W 1 192.168.101.3 |grep " 0% packet loss")
			#echo 1. $pinginfo
			if [ -n "$pinginfo" ]; then # detected my phone
				sleep 5
				pinginfo=$(ping -c 1 -W 1 192.168.101.3 |grep " 0% packet loss")
				#echo 2. $pinginfo
				if [ -z "$pinginfo" ]; then #from connected to unconnected
					lock
				fi
				continue # have been wait for 5 seconds no need for waiting another 5 second at last
			fi
		fi
	fi
	sleep 5
done
