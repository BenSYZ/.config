#!/bin/bash
wifi_dev="wlp5s0"
#wifi=$( ip addr | grep "wlp5s0" |grep -E -o "inet ([0-9]{1,3}[\.]){3}[0-9]{1,3}" |awk '{print $2 " "}' )
#wifi=$(ip addr | grep "inet .* wlp5s0" |sed -n 's/\ *inet\ *\(\([0-9]\{1,3\}.\)\{3\}.[0-9]\{1,3\}\).*/\1/p')
#wifi=$(ip addr | grep "inet .* wlp5s0" |sed -n 's/\ *inet\ *\([0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}\).*/\1/p')
#wifi=$(ip addr | grep "inet .* wlp5s0" |sed -n 's/\ *inet\ *\(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\).*/\1/p')
wifi=$(ip addr show "$wifi_dev" |awk '$1=="inet" {print(substr($2, 1, index($2,"/")-1))}')
#line=$( ip addr | grep "enp4s0" |grep -E -o "inet ([0-9]{1,3}[\.]){3}[0-9]{1,3}" |awk '{print $2 " "}' )
#line=$(ip addr | grep "inet .* enp4s0" |sed -n 's/\ *inet\ *\(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\).*/\1/p')
line=""
for netcard in $(ip l show |sed -n 's/^[0-9]*: \([^:]*\):.*LOWER_UP>.*/\1/p' |grep -v lo);do
    line_info="$netcard ""$(ip addr show "$netcard" |awk '$1=="inet" {print(substr($2, 1, index($2,"/")-1))}')"
    line="${line:+$line | }󰈁 $line_info"
done

# hostname -i
# ip addr show dev wlp5s0

# when have special meaning
# sed {: \{
# sed (: \(, no matter if it's a group
# sed ?: \?
# sed [: [


if [ -n "$wifi" ]; then
    signal_strength=$(awk 'NR==3 {print $3}' /proc/net/wireless)
    #ap=$(iw dev wlp5s0 info |awk '$1 == "ssid" {print $2}' |sed -n 's/.*\(..\)/\1/p')
    ap="$(iwgetid $wifi_dev | sed -n 's/.*ESSID:"\(.*\)"$/\1/p')"
    short_ap="$(echo "$ap" | sed -n 's/\(..\).*\(..\)$/\1-\2/p')"
    echo -n "  $wifi"
    echo -n " (${signal_strength%\.}% .$short_ap)"

fi

if [ -n "$line" ] && [ -n "$wifi" ];then
    echo -n " |"
fi

if [ -n "$line" ]; then
    echo -n "$line"
fi
echo
