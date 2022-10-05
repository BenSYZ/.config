#!/bin/bash
WORKSPACE=$1
WKSP="$(xprop -root -notype  _NET_CURRENT_DESKTOP | sed 's#.* =##')"
CURRENT_WORKSPACE="$((1 + WKSP))"
if [ "$CURRENT_WORKSPACE" -ne "$WORKSPACE" ]; then
    scrot -q 50 /tmp/.PRTSRC.jpeg
    feh /tmp/.PRTSRC.jpeg&
    sleep .1
    #i3-msg "[class=feh] floating enable"
    FEH_WINDOW=$!
    #WAIT (give i3 time to switch workspace in the background)

    winid=$FEH_WINDOW
    winid="$(wmctrl -lp | awk -vpid=$pid '$3==pid {print $1; exit}')"
    # Focus the window we found
    wmctrl -i "${winid}"
    i3-msg floating enable, sticky enable, border pixel 0, move absolute position 0 px 0 px > /dev/null

    sleep .1
    rm /tmp/.PRTSRC.jpeg
fi
slide_FEH_LEFT(){
    LONG_LINE="move left 1px"
    for i in {1..11}; do
        LONG_LINE=$LONG_LINE","$LONG_LINE
    done
    i3-msg "$LONG_LINE" > /dev/null
}
slide_FEH_RIGHT(){
    LONG_LINE="move right 1px"
    for i in {1..11}; do
        LONG_LINE=$LONG_LINE","$LONG_LINE
    done
    i3-msg "$LONG_LINE"  > /dev/null
}
if [ "$CURRENT_WORKSPACE" -gt "$WORKSPACE" ]; then
    slide_FEH_RIGHT
else
    slide_FEH_LEFT
fi
#SIMPLE KILL AFTER 500ms
{ sleep .5 && kill $FEH_WINDOW; } &

#bindsym $mod+1 exec "~/.config/i3/scripts/gotoworkspace.sh 1 && i3-msg workspace 1"
#bindsym $mod+2 exec "~/.config/i3/scripts/gotoworkspace.sh 2 && i3-msg workspace 2"
#bindsym $mod+3 exec "~/.config/i3/scripts/gotoworkspace.sh 3 && i3-msg workspace 3"
#bindsym $mod+4 exec "~/.config/i3/scripts/gotoworkspace.sh 4 && i3-msg workspace 4"
#bindsym $mod+5 exec "~/.config/i3/scripts/gotoworkspace.sh 5 && i3-msg workspace 5"
#bindsym $mod+6 exec "~/.config/i3/scripts/gotoworkspace.sh 6 && i3-msg workspace 6"
#bindsym $mod+7 exec "~/.config/i3/scripts/gotoworkspace.sh 7 && i3-msg workspace 7"
#bindsym $mod+8 exec "~/.config/i3/scripts/gotoworkspace.sh 8 && i3-msg workspace 8"
#bindsym $mod+9 exec "~/.config/i3/scripts/gotoworkspace.sh 9 && i3-msg workspace 9"
#bindsym $mod+0 exec "~/.config/i3/scripts/gotoworkspace.sh 10 && workspace 10"
#for_window [title="feh"] floating enable, floating enable, sticky enable, border pixel 0, move absolute position 0 px 0 px

#https://unix.stackexchange.com/questions/370622/workspace-sliding-animation-in-i3
