#!/bin/zsh

#POSITION=yuyao,zhejiang
POSITION=nanshan,shenzhen

nmc_report(){
    position="$1"
    case "$position" in 
        "yuyao_zhejiang")
            stationid=58468
            ;;
        "nanshan_shenzhen")
            stationid=59493
            ;;
    esac

    echo stationid=$stationid >&2
    url="http://www.nmc.cn/rest/weather?stationid=$stationid&_=$(date +%s)"

    raw_jq=$(curl -s "$url")
    #echo $raw_jq > /tmp/ben.log
    #raw_jq=$(cat /tmp/ben.log)
    #echo $raw_jq |jq >&2
    parser=(-r '.data.real.weather | "\(.temperature)|\(.info)"')

    result=$(jq "${parser[@]}" <<< "$raw_jq")
    echo "$result" >&2
    IFS="|" read -r temp info <<< "$result"
    echo  "\"$reportEn\" ) #$report" >> ~/"weather.log"

    temp="$temp"
    report="$info"
    echo "$temp|$info"
}

121_report(){
    position="$1"
    case "$position" in 
        "nanshan_shenzhen")
            station_abbr=ns
            ;;
    esac

    date_s=$(($(date +%s) + 1800)) # current time +30min, then the hour is the closest o'clock
    url="https://weather.121.com.cn/data_cache/szWeather/fenquyubao/MESISarea_$station_abbr.js"  #\?_\&_\=$(date -d "@$date_s" +%s)"
    prefix="try{ var WF_ns = "
    suffix=";}catch(e){}"
    #curl "$url"
    raw_jq=$(curl -s "$url" | sed -n "s/$prefix\(.*\)$suffix/\1/p" )
    echo -n 'raw_jq=' >&2
    echo "$raw_jq" |jq >&2 # >> ~/weather_raw.log

    reportTime="$(date -d "@$((date_s))" +%Y-%m-%d" "%H:00:00)"
    echo "reportTime=$reportTime" >&2
    parser=(-r --arg reportTime "$reportTime" '.hoursweather[] | select(.reportTime == $reportTime) | "\(.minT)|\(.maxT)|\(.reportEn)|\(.report)"')

    result=$(jq "${parser[@]}" <<< "$raw_jq")
    echo "result=$result" >&2

    if [ -z "$result" ];then
        parser=(-r --arg reportTime "$reportTime" '.dayreport | "\(.minT)|\(.maxT)|\(.reportEn)|\(.report)"')
    fi
    result=$(jq "${parser[@]}" <<< "$raw_jq")
    echo "result=$result" >&2

    IFS="|" read -r minT maxT reportEn report <<< "$result"
    echo  "\"$reportEn\" ) #$report" >> ~/"weather.log"


    temp="$minT~$maxT"
    if [ "$minT" = "$maxT" ];then
        temp="$minT"
    fi

    echo "$temp|$reportEn"
}

show(){
    IFS="|" read -r temp report <<< "$@"
    color=""
    icon=""
    case "$report" in
        "晴"                            |"Sunny")
            color="#ffb84d"
            icon="󰖨"
            ;;
        *"云"                           |"Partly cloudy" | "Cloudy") # 少云 | 多云
            color="#acc2d9"
            icon="\ue312"
            ;;
        "阴"                            |"Overcast")
            color="#c7c9c9"
            icon="󰖐"
            ;;
        *"雨"                           |"Cloudy, with shower" | "Overcast, with shower" | "Overcast, with light rain" ) # |多云有阵雨|阵雨|小雨
            color="#81c3fc"
            icon="\ue319"
            ;;

        *"雪")
            color="#d5e4f7"
            icon=""
    esac

    icon="$icon "
    color_icon="<span color=\"$color\">$icon</span>"

    if [ -z "$temp" ];then
        return
    fi
    printf "$color_icon$temp°C""\n"
}

yuyao_zhejiang(){
    nmc_report "$0"
}
nanshan_shenzhen(){
    121_report "$0"
}

show "$(eval ${POSITION/,/_})"

# for variety
#timeout 10 curl -s "http://wttr.in/${POSITION}_0qp_transparency=200.png" -o /tmp/.variety_wttr.png

variety_wttr(){
    export TEXTIMG_FONT_FILE="/usr/share/fonts/TTF/SauceCodeProNerdFont-Medium.ttf"
    curl --max-time 1 -sf "http://wttr.in/${POSITION}?q0" > /tmp/.variety_wttr_m.txt
    if ! [ -s /tmp/.variety_wttr_m.txt ];then
        rm /tmp/.variety_wttr_m.png
        rm /tmp/.variety_wttr.png
    fi

    cat  /tmp/.variety_wttr_m.txt | textimg -F 15 -o /tmp/.variety_wttr_m.png
    convert /tmp/.variety_wttr_m.png -bordercolor black  -border 10x10 -alpha set -background none -channel A -evaluate multiply 0.8 +channel /tmp/.variety_wttr.png
}
set -e
variety_wttr

# url
# https://weather.cma.cn/web/weather/58468.html

# http://www.weather.com.cn/weather1d/101210404.shtml
# http://www.nmc.cn/publish/forecast/AZJ/yuyao.html
# http://nb.zj.weather.com.cn/
#
# emoji
# https://unicode-table.com/cn/emoji/travel-and-places/sky-and-weather/
