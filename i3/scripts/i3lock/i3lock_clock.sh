#!/bin/bash

# at lock corner -> 0
# not -> 1
atLockCorner(){
	#return 1
	#DEBUG at corner xautolock exec this script. Then cheat the script, jump over the force lock due to at corner, and know it is not lock due to playing
	# -0+0
	# purpose: move to left-down position(Manually), lock
	#read -r x y <<< $(xdotool getmouselocation |sed -n 's/x:\([0-9]*\)\ y:\([0-9]*\).*/\1 \2/p')
	read -r x y < <(xdotool getmouselocation |sed -n 's/x:\([0-9]*\)\ y:\([0-9]*\).*/\1 \2/p')
	read -r resolution_x resolution_y < <(xrandr|awk -v FS=",| " '$0 ~ "current" {print $9" "$11}')
	#resolution_y=$(xrandr |awk -v FS=",| " '$0 ~ "current" {print $11}')

	lock_area_width=30
	x_border="$lock_area_width"
	y_border="$((resolution_y - lock_area_width))"

	## up left 	not lock
	#if [[ $x -lt 31 && $y -lt 31 ]];then
	#	return 1
	## down left 	lock
	#elif [[ $x -lt 31 && $y -gt 738 ]];then
	#	return 0
	#fi
	if [[ "$x" -lt "$x_border" && $y -gt "$y_border" ]];then
		xdotool mousemove "$((resolution_x/2))" "$((resolution_y/2))"
		return 0
	else
		return 1
	fi

}

# playing -> 0
# not -> 1
isPlaying (){
	while read -r in; do
		playerName=$(echo "$in" | cut -f 1 -d " ");
		playerStatus=$(echo "$in" | cut -f 2 -d " ");
		if [[ "$playerName" != "netease-cloud-music" ]] && [[ "$playerStatus" == "playing" ]]; then
			#echo a
			return 0
		fi
	done < <(playerctl --all-players metadata --format '{{playerName}} {{lc(status)}}')
	#done <<<$(playerctl --all-players metadata --format '{{playerName}} {{lc(status)}}')
	# "~/Tips/<.md"

	# zoom
	if pgrep "/opt/zoom/zoom" |grep -q -v grep;then
		echo zoom
		return 0
	fi
	# wemeet
	if pgrep "wemeetapp.exe" |grep -q -v grep;then
		echo wemeet
		return 0
	fi

	return 1
}

lock(){
	if_i3lock_exist="$(pgrep 'i3lock -i'|grep -v 'grep'|grep -v 'tty')"
	# tty is that in .xinitric
	[ -n "$if_i3lock_exist" ] && exit 0
	xset s 7 -b

	import -window root png:- | convert - -resize 20% -gamma .45455 -blur 4x5 -gamma 2.2 -resize 500% /tmp/.screenlock.png

	#import -window root png:- | convert - -gamma .45455 -blur 5x10 -gamma 2.2 /tmp/.screenlock.png
	#import -window root png:- | convert - -blur 5x10 /tmp/.screenlock.png
	#scrot -z -e 'mv $f /tmp/i3lock.png'
	#convert /tmp/i3lock.png -blur 5x10 /tmp/i3lock.png
	#i3lock -i /tmp/.screenlock.png -n -c '#000000' -o '#191d0f' -w '#572020' -e --no-keyboard-layout --no-input-visualisation
	sleep_target=$(systemctl is-active i3lock@ben.service)
	#echo "$sleep_target"
	if [ "$sleep_target" = "inactive" ] || [ "$sleep_target" = "failed" ];then
		i3lock -i /tmp/.screenlock.png -n -c '#000000' -o '#191d0f' -w '#572020' -e --no-keyboard-layout
	fi
	# --no-keyboard-layout: US
	# --no-input-visualisation: ***

	rm /tmp/.screenlock.png
	# -l '#ffffff' waiting
	autotiling > /dev/null 2>&1 &
	xset s off
}

if [ "$1" == "-f" ];then
    lock
    exit
fi

if  atLockCorner ;then
	#echo a
	lock
	exit
elif  ! isPlaying ;then
	#echo b
	lock
	exit
fi
