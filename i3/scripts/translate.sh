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


translate(){

    #wudao dictionary
    #bindsym $mod+w exec --no-startup-id python ~/.config/i3/scripts/wudao_notification.py
    #bindsym $mod+shift+w exec --no-startup-id "xclip -selection c -o |sed ':a;N;$!ba;s/[\n\r]/ /g'| ~/.config/i3/scripts/wudao.sh"
    #bindsym $mod+w exec --no-startup-id "xsel |sed ':a;N;$!ba;s/[\n\r]/ /g'| ~/.config/i3/scripts/wudao.sh"
    # google translation
    # https://stackoverflow.com/questions/1251999/how-can-i-replace-a-newline-n-using-sed
    # 1. :a create a label 'a'
    # 2. N append the next line to the pattern space
    # 3. $! if not the last line, ba branch (go to) label 'a'
    # 4. s substitute, /\n/ regex for new line, / / by a space, /g global match (as many times as it can)
    #bindsym $mod+shift+t exec --no-startup-id "xclip -selection c -o|sed ':a;N;$!ba;s/[\n\r]/ /g'| trans  -t chinese -b |xargs -0 notify-send -t 0"
    #bindsym $mod+t exec --no-startup-id "xsel |sed ':a;N;$!ba;s/\n/ /g'| trans  -t chinese -b |xargs -0 notify-send -t 0"
    #bindsym $mod+t exec --no-startup-id "xclip -selection c -o|sed ':a;N;$!ba;s/\n/ /g'| trans  -t chinese -b |xclip -selection c"
    tobetranslated="$1"

    # By chatgpt:
    #     RS="" tells awk to treat consecutive newlines as a record separator.
    #     ORS="\n\n" sets the output record separator to two newlines, preserving paragraph breaks.
    #     gsub(/\n/, " ") replaces single newlines with spaces within paragraphs.
    tobetranslated="$(echo "$tobetranslated" | awk 'BEGIN{RS=""; ORS="\n\n"} {gsub(/\n/, " "); print}')"
    echo "tobetranslated: $tobetranslated"
    numtobetranslated=$(echo "$tobetranslated" |wc -w)

    if [ "$numtobetranslated" -gt 1 ]; then
        translated=$(trans  -t chinese -b -- "$tobetranslated")
        echo "translated: $translated"

        # notify
        {
            ACTION=$(dunstify --timeout=60000 --action="default,Reply" --action="forwardAction,Forward" -- "$translated")
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
}

main(){
    #if [ "$XDG_SESSION_TYPE" = wayland ];then
    #    clipboard_paste_cmd="wl-paste"
    #else
    #    clipboard_paste_cmd="xclip -selection c -o"
    #fi

    clipboard_paste_cmd="xclip -selection c -o"
    selection_cmd="xsel"

    if [ "$1" = "clipboard" ];then
        translate "$(eval "$clipboard_paste_cmd")"
    fi
    if [ "$1" = "selection" ];then
        translate "$(eval "$selection_cmd")"
    fi
}
main "$@"
