#!/bin/sh
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
    echo "$@"|xclip -selection c
}


read tobetranslated

echo "$tobetranslated"
numtobetranslated=$(echo "$tobetranslated" |wc -w)

if [ "$numtobetranslated" -gt 1 ]; then
    translated=$(trans  -t chinese -b "$tobetranslated")

    # notify
    {
        ACTION=$(dunstify --timeout=60000 --action="default,Reply" --action="forwardAction,Forward" "$translated")
        case "$ACTION" in
            "default")
                reply_action "$translated"
                ;;
            "forwardAction")
                forward_action
                ;;
            "2")
                handle_dismiss
                ;;
        esac
    } & # show trans in sentence first

fi

if [ "$numtobetranslated" -lt 5 ]; then
    for i in $tobetranslated
    do
        wd "$i" | sed -r 's/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g'| xargs -0 notify-send
    done
fi

