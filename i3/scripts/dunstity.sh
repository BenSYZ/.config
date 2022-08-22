#!/bin/sh
#
# https://github.com/dunst-project/dunst/issues/163
#When using --action, dunstify will either return the action name you specify or a number. The number adheres to the Notification spec, so if 1 is returned, the notification expired and if 2 is returned then the notification was dismissed by the user.

reply_action () {
    echo
}
forward_action () {
    echo
}
handle_dismiss () {
    echo
}

my_notify(){
    ACTION=$(dunstify --action="default,Reply" --action="forwardAction,Forward" "$0")

    case "$ACTION" in
    "default")
	reply_action
	;;
    "forwardAction")
	forward_action
	;;
    "2")
	handle_dismiss $0
	;;
    esac
}
