#!/bin/sh
[ "$(xrandr|grep -c ' connected')" -eq 2 ] && xrandr --output eDP-1  --off
