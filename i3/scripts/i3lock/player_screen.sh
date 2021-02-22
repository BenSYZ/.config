#!/bin/bash

# -0+0
# purpose: move to left-down position(Manually), lock
#read -r x y <<< $(xdotool getmouselocation |sed -n 's/x:\([0-9]*\)\ y:\([0-9]*\).*/\1 \2/p')
read -r x y < <(xdotool getmouselocation |sed -n 's/x:\([0-9]*\)\ y:\([0-9]*\).*/\1 \2/p')

if [[ $x -lt 31 && $y -lt 31 ]];then
	return 1
elif [[ $x -lt 31 && $y -gt 738 ]];then
	return 0
fi


while read in; do
	playerName=$(echo "$in" | cut -f 1 -d " ");
	playerStatus=$(echo "$in" | cut -f 2 -d " ");
	if [[ "$playerName" != "netease-cloud-music" ]] && [[ "$playerStatus" == "playing" ]]; then
		#echo a
		return 1
	fi
done < <(playerctl --all-players metadata --format '{{playerName}} {{lc(status)}}')
#done <<<$(playerctl --all-players metadata --format '{{playerName}} {{lc(status)}}')
# "~/Tips/<.md"

# zoom
if [[ -n $(ps -ef|grep "/opt/zoom/zoom" |grep -v grep) ]];then
	return 1
fi

return 0
