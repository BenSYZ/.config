#!/bin/sh
MODE(){
  zenity --list --title="Second Screen position" --column="Option" \
  'off' \
  'duplicate' \
  'left'
}

variety_set(){
  killall variety >/dev/null 2>&1 &
  feh --bg-fill  ~/Pictures/LockScreen.png
  sleep 2
  env i3script_multiscreen=true variety >/dev/null 2>&1 &
}


multi_window_set(){
  case "$MODE" in
    "off")
      #echo off;;
      xrandr --output $SECONDARY_SCREEN_NAME --off;;
    "duplicate" | "left" )
      xrandr --output $SECONDARY_SCREEN_NAME --auto;
      xrandr --output $MAIN_SCREEN_NAME --auto;;&
    "duplicate")
      #echo auto;
      xrandr --output $SECONDARY_SCREEN_NAME --same-as $MAIN_SCREEN_NAME;;
    "left")
      #echo left;
      xrandr --output $SECONDARY_SCREEN_NAME --left-of $MAIN_SCREEN_NAME;;
    *)
      exit 1;
      ;;
      #echo other
      #xrandr --output $SECONDARY_SCREEN_NAME --off;;
  esac
}


main(){

  SECONDARY_SCREEN_NAME="$(xrandr --listmonitors |awk '{print $4}' |grep .|grep -v 'eDP-1'|awk 'NR==1 {print $1}')"
  MAIN_SCREEN_NAME="eDP-1"

  [ -n "$SECONDARY_SCREEN_NAME" ] && [ MODE ] && multi_window_set &&  variety_set || exit 0

}

main





# other help
# # name will be different with xf86-video-intel
# xrandr --output DP2 --rotate left #(left down)

# #xrandr --output eDP1 --fbmm 1600x900
# xrandr --output DP2 --auto
# #xrandr --output DP-2 --auto # remove xf86-video-intel
# #xrandr --output HDMI1 --auto
#
# xrandr --output eDP1 --auto
# #xrandr --output eDP-1 --auto
# #xrandr --output eDP1 --auto --output DP2 --auto
# xrandr --output eDP1 --right-of DP2
# #xrandr --output eDP-1 --right-of DP-2
# #xrandr --output eDP1 --right-of HDMI1
#
# #xrandr --output eDP1 --below HDMI1
# #xrandr --output DP2 --rotate left
