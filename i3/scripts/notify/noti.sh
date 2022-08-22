#/bin/bash
DISPLAY=":0"
XAUTHORITY="/home/ben/.Xauthority"
XDG_RUNTIME_DIR="/run/user/1000"
DBUS_SESSION_BUS_ADRESS=unix:path=/run/user/1000/bus
#echo $DISPLAY
/usr/bin/notify-send -t 0 $* || echo "$*" | /usr/bin/mail -s 'at notify' ben
/usr/bin/canberra-gtk-play --display=$DISPLAY -f /home/ben/.config/i3/scripts/notify/notify.wav
