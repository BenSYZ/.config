#!/bin/sh
volume=$(amixer | grep 'Master' -A 5|sed -n "s/.*\[\([0-9][0-9]\?[0-9]\?%\)\] \[\(.*\)\]/\1 \2/p")
case "$volume" in
    *"off"*)
        echo '<span color="#ff79c6"></span>'
        ;;
    *"on"*)
        echo '<span color="#ff79c6"> '"${volume% on}"'</span>'
        ;;
esac
