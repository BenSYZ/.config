#!/bin/bash
#BASEDIR=$(dirname "$0")
#echo "$BASEDIR"
#
#source $BASEDIR/dunstity.sh


raw_copy(){
    xclip -selection clipboard -t image/png -i "$1" # && trash-put "$1"
}

path_copy(){
    # help: xclip -selection clipboard -target TARGETS -o
    #xclip -selection clipboard -t UTF8_STRING -o
    echo "$1" | xclip -selection clipboard -target UTF8_STRING -i
    #xclip -selection clipboard -t UTF8_STRING -o
}


main(){
    mode="$1"
    mode=select
    case "$mode" in
        "select")
            screenshot_name="$(scrot -q 100 -z -s  "$HOME"/Pictures/screenshots/'%Y-%m-%d_%H%M%S_$wx$h_scrot.png' -e 'echo -n $f')"
            ;;
        "border")
            screenshot_name="$(scrot -q 100 -z -bs "$HOME"/Pictures/screenshots/'%Y-%m-%d_%H%M%S_$wx$h_scrot.png' -e 'echo -n $f')"
            ;;
        "default")
            screenshot_name="$(scrot -q 100 -z     "$HOME"/Pictures/screenshots/'%Y-%m-%d_%H%M%S_$wx$h_scrot.png' -e 'echo -n $f')"
            ;;
    esac

    ACTION=$(dunstify --timeout=60000 --action="default,Copy Image's raw data" --action="PathCopy,Copy File Path" --action="Close,Do nothing" "scrot $mode" "screenshot has been saved as $screenshot_name.")
    echo "$ACTION"
    case "$ACTION" in
        "default") # right click
            raw_copy "$screenshot_name"
            ;;
        "2")
            path_copy "$screenshot_name"
            ;;
        # from do_actions
        "PathCopy")
            path_copy "$screenshot_name"
            ;;
        "Close")
            do_action
            ;;
    esac
}

main "$1"

