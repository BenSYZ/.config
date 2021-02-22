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

	## up left 	not lock
	#if [[ $x -lt 31 && $y -lt 31 ]];then
	#	return 1
	## down left 	lock
	#elif [[ $x -lt 31 && $y -gt 738 ]];then
	#	return 0
	#fi
	if [[ $x -lt 31 && $y -gt 738 ]];then
		return 0
	else
		return 1
	fi

}

# playing -> 0
# not -> 1
isPlaying (){
	while read in; do
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
	if [[ -n $(ps -ef|grep "/opt/zoom/zoom" |grep -v grep) ]];then
		return 0
	fi

	return 1
}

lock(){
	xset s 7 -b

	import -window root png:- | convert - -resize 20% -gamma .45455 -blur 4x5 -gamma 2.2 -resize 500% /tmp/.screenlock.png

	#import -window root png:- | convert - -gamma .45455 -blur 5x10 -gamma 2.2 /tmp/.screenlock.png
	#import -window root png:- | convert - -blur 5x10 /tmp/.screenlock.png
	#scrot -z -e 'mv $f /tmp/i3lock.png'
	#convert /tmp/i3lock.png -blur 5x10 /tmp/i3lock.png
	i3lock -i /tmp/.screenlock.png -n -c '#000000' -o '#191d0f' -w '#572020' -e --no-keyboard-layout --no-input-visualisation
	# --no-keyboard-layout: US
	# --no-input-visualisation: ***

	rm /tmp/.screenlock.png
	# -l '#ffffff' waiting

	xset s off
}

if  atLockCorner ;then
	echo a
	lock
	exit
elif  ! isPlaying ;then
	echo b
	lock
	exit
fi
