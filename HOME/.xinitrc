export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
#export QT_STYLE_OVERRIDE=adwaita
export QT_QPA_PLATFORMTHEME=qt5ct
#export GTK_IM_MODULE DEFAULT=fcitx
#export QT_IM_MODULE  DEFAULT=fcitx
#export XMODIFIERS    DEFAULT="@im=fcitx"
#export SDL_IM_MODULE DEFAULT=fcitx
numlockx &
#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
export DESKTOP_SESSION=gnome

export LANG=zh_CN.utf-8
fcitx5 &
picom &
variety &
udiskie -snA&
export LANG=en_US.UTF-8
# notification
dunst &
xset s 0 -dpms &


xset s 7 -b
i3lock -i /home/ben/Pictures/LockScreen.png -n -c '#000000' -o '#191d0f' -w '#572020' -e --no-keyboard-layout --no-input-visualisation
#~/.config/i3/scripts/i3lock/i3lock.sh
xset s off

exec i3
#exec awesome
#exec dwm
