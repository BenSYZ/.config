#!/bin/bash

lock_acquire(){
    lock_file="$1"
    exec {lock_fd}>"$lock_file"
    flock --nonblock "$lock_fd"
}
lock_release(){
    test "$lock_fd" || return 1

    exec {lock_fd}>&- && unset lock_fd
}

# playing -> 0
# not -> 1
isPlaying (){
    while read -r player_name player_status; do
        if [[ "$player_name" != "netease-cloud-music" ]] && [[ "$player_status" == "playing" ]]; then
            #echo a
            return 0
        fi
    done < <(playerctl --all-players metadata --format '{{playerName}} {{lc(status)}}')

    #done <<<$(playerctl --all-players metadata --format '{{playerName}} {{lc(status)}}')
    # "~/Tips/<.md"

    # zoom
    if pgrep "/opt/zoom/zoom" |grep -q -v grep;then
        echo zoom
        return 0
    fi
    # wemeet
    if pgrep "wemeetapp.exe" |grep -q -v grep;then
        echo wemeet
        return 0
    fi

    if pgrep "steam.exe" |grep -q -v grep;then
        echo steam
        return 0
    fi

    return 1
}

x11_screen_lock_prepare(){
    if_i3screen_lock_exist="$(pgrep 'i3lock -i'|grep -v 'grep'|grep -v 'tty')"
    # tty is that in .xinitric
    [ -n "$if_i3screen_lock_exist" ] && exit 0
    xset s 7 -b

    import -window root png:- | convert - -resize 20% -gamma .45455 -blur 4x5 -gamma 2.2 -resize 500% /tmp/.screenlock.png
    #import -window root png:- | convert - -gamma .45455 -blur 5x10 -gamma 2.2 /tmp/.screenlock.png
    #import -window root png:- | convert - -blur 5x10 /tmp/.screenlock.png
    #scrot -z -e 'mv $f /tmp/i3lock.png'
    #convert /tmp/i3lock.png -blur 5x10 /tmp/i3lock.png
    #i3lock -i /tmp/.screenlock.png -n -c '#000000' -o '#191d0f' -w '#572020' -e --no-keyboard-layout --no-input-visualisation
}

x11_screen_lock(){
    sleep_target=$(systemctl is-active i3lock@ben.service)
    #echo "$sleep_target"
    if [ "$sleep_target" = "inactive" ] || [ "$sleep_target" = "failed" ];then
        i3lock -i /tmp/.screenlock.png -n -c '#000000' -o '#191d0f' -w '#572020' -e --no-keyboard-layout
    fi
    # --no-keyboard-layout: US
    # --no-input-visualisation: ***

    rm /tmp/.screenlock.png
    # -l '#ffffff' waiting
    autotiling > /dev/null 2>&1 &
    xset s off
}


wayland_screen_lock(){
    [ -e "$(sway --get-socketpath)" ] || SWAYSOCK=/run/user/$(id -u)/sway-ipc.$(id -u).$(pgrep -x sway).sock
    lock_file="$SWAYSOCK".screen_lock
    if ! lock_acquire "$lock_file";then
        return
    fi
    swaylock -i /tmp/.screenlock.png --indicator-radius  100
    lock_release
}
wayland_screen_lock_prepare(){
    grim -t png - | convert - -resize 20% -gamma .45455 -blur 4x5 -gamma 2.2 -resize 500% /tmp/.screenlock.png
}

screen_lock_prepare(){
    "$display_server"_screen_lock_prepare
}


screen_lock(){
    "$display_server"_screen_lock
}

main(){
    if [ "$XDG_SESSION_TYPE" = wayland ];then
        display_server="wayland"
    else
        display_server="x11"
    fi

    if [ "$1" = "-f" ];then
        screen_lock_prepare
        screen_lock
        return 0
    fi

    if [ "$1" = "-p" ];then
        screen_lock_prepare
        return 0
    fi

    if isPlaying ;then
        return 1
    fi

    screen_lock
}
main "$@"
