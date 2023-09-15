#!/bin/zsh
#POSITION=ningbo,zhejiang
POSITION=nanshan,shenzhen
[ "$POSITION" = "ningbo,zhejiang" ] && stationid=58468
[ "$POSITION" = "nanshan,shenzhen" ] && stationid=59493
echo $(curl -s http://www.nmc.cn/rest/weather\?stationid\=$stationid\&_\=$(date +%s) |jq -r '.data.real.weather | "\(.temperature) \(.info)"' | awk '
{if ($2=="晴") print "<span color=\"#ffb84d\">󰖨 </span>";};
{if ($2~".云") print "<span color=\"#acc2d9\"> </span>";};
{if ($2=="阴") print "<span color=\"#c7c9c9\">󰖐 </span>";};
{if ($2~".雨") print "<span color=\"#81c3fc\">🌧</span>";};
{if ($2~".雪") print "<span color=\"#d5e4f7\"> </span>";};
{ printf $1 "°C "} ;
    ')
timeout 10 curl "http://wttr.in/${POSITION}_0qp_transparency=200.png" -o /tmp/.variety_wttr.png

# url
# https://weather.cma.cn/web/weather/58468.html

# http://www.weather.com.cn/weather1d/101210404.shtml
# http://www.nmc.cn/publish/forecast/AZJ/yuyao.html
# http://nb.zj.weather.com.cn/
#
# emoji
# https://unicode-table.com/cn/emoji/travel-and-places/sky-and-weather/
