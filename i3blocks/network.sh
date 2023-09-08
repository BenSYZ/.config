#!/bin/bash
show_text=""
for netcard in $(ip l show |sed -n 's/^[0-9]*: \([^:]*\):.*LOWER_UP>.*/\1/p' |grep -v lo);do
    line_info=""
    ap="$(iwgetid "$netcard" | sed -n 's/.*ESSID:"\(.*\)"$/\1/p')"
    ip_addr="$(ip addr show "$netcard" |awk '$1=="inet" {print(substr($2, 1, index($2,"/")-1))}')"
    ip_addr="${ip_addr/#192.168/-}" # remove 192.168
    [ -z "$ip_addr" ] && \
        continue

    if [ -n "$ap" ];then
        echo "wireless"         >&2
        short_ap="$(echo "$ap" | sed -n 's/\(..\).*\(.\)$/\1..\2/p')"
        signal_strength=$(awk 'NR==3 {print $3}' /proc/net/wireless)
        line_info="  $netcard $ip_addr|${signal_strength%\.}%|$short_ap"
    else
        echo "line"             >&2
        line_info="󰈁 $netcard $ip_addr"
    fi
    show_text="${show_text:+$show_text│}$line_info"
done
echo "$show_text"
