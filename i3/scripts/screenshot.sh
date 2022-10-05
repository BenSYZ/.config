#!/bin/bash
#BASEDIR=$(dirname "$0")
#echo "$BASEDIR"
#
#source $BASEDIR/dunstity.sh


reply_action () {
    echo
}
forward_action () {
    echo
}
handle_dismiss () {
    echo
}

reply_action(){
    echo "$1"
    #xclip -selection clipboard -t image/png -i "$1" #&& rm $1
    xclip -selection clipboard -t text -i <<<"$(echo $1)" #&& rm $1
}


main(){
    mode="$1"
    case "$mode" in
        "select")
            screenshot_name="$(scrot -q 100 -z -s '/home/ben/Pictures/screenshots/%Y-%m-%d_%H%M%S_$wx$h_scrot.png' -e 'echo $f')"
            ;;
        "border")
            screenshot_name="$(scrot -q 100 -z -bs '/home/ben/Pictures/screenshots/%Y-%m-%d_%H%M%S_$wx$h_scrot.png' -e 'echo $f')"
            forward_action
            ;;
        "default")
            screenshot_name="$(scrot -q 100 -z '/home/ben/Pictures/screenshots/%Y-%m-%d_%H%M%S_$wx$h_scrot.png' -e 'echo $f')"
            ;;
    esac

    ACTION=$(dunstify --timeout=60000 --action="default,Reply" --action="forwardAction,Forward" "scrot $mode" "screenshot has been saved as $screenshot_name.")
    case "$ACTION" in
        "default")
            reply_action "$screenshot_name"
            ;;
        "forwardAction")
            forward_action
            ;;
        "2")
            handle_dismiss
            ;;
    esac
}

main "$1"

