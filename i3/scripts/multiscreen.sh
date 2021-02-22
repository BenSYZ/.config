#xrandr --output eDP1 --fbmm 1600x900
xrandr --output DP2 --auto
#xrandr --output DP-2 --auto # remove xf86-video-intel
#xrandr --output HDMI1 --auto

xrandr --output eDP1 --auto
#xrandr --output eDP-1 --auto
#xrandr --output eDP1 --auto --output DP2 --auto
xrandr --output eDP1 --right-of DP2
#xrandr --output eDP-1 --right-of DP-2
#xrandr --output eDP1 --right-of HDMI1

#xrandr --output eDP1 --below HDMI1
#xrandr --output DP2 --rotate left
