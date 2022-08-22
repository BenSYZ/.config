#!/bin/sh
netease_player_tile=$(playerctl --all-players metadata|sed -n "s/\(netease-cloud-music xesam\:title\) *\([^ ]*\)/\2/p")
mini_info=$(xwininfo -tree -root|grep Music |grep "$netease_player_tile" |grep -v "+0+0")
#echo $mini_info
if [ "$mini_info" != "" ];then
    echo a
fi
#i3
# for_window [class="netease-cloud-music"] sticky enable
