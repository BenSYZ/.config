#!/bin/zsh
#POSITION=ningbo,zhejiang
POSITION=nanshan,shenzhen
[ "$POSITION" = "ningbo,zhejiang" ] && stationid=58468
[ "$POSITION" = "nanshan,shenzhen" ] && stationid=59493
echo $(curl -s http://www.nmc.cn/rest/weather\?stationid\=$stationid\&_\=$(date +%s) |jq -r '.data.real.weather | "\(.temperature) \(.info)"' | awk '{ printf $1 "°C "} ;
{if ($2=="晴") print "☀ ";};
{if ($2~".云") print "⛅";};
{if ($2=="阴") print "☁ ";};
{if ($2~".雨") print "🌧 ";};
{if ($2~".雪") print "❄ ";}; ')
curl "http://wttr.in/${POSITION}_0qp_transparency=200.png" -o /tmp/.variety_wttr.png

# url
# https://weather.cma.cn/web/weather/58468.html

# http://www.weather.com.cn/weather1d/101210404.shtml
# http://www.nmc.cn/publish/forecast/AZJ/yuyao.html
# http://nb.zj.weather.com.cn/
#
# emoji
# https://unicode-table.com/cn/emoji/travel-and-places/sky-and-weather/
