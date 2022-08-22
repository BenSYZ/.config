[ "$(xrandr|grep ' connected'|wc -l)" -eq 2 ] && xrandr --output eDP-1  --off
