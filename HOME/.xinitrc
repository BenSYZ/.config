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

xrdb -merge ~/.Xresources

variety &
export LANG=zh_CN.utf-8
export LC_LANG=und
# 如果系统的 Locale 是中文，请将 LC_LANG 设置为 und，否则中英文文字都会使用中文字体渲染。
fcitx5 &
picom &
udiskie -snA&
export LANG=en_US.UTF-8
# notification
dunst &
xset s 0 -dpms &


xset s 7 -b
#i3lock -i /home/ben/Pictures/LockScreen.png -n -c '#000000' -o '#191d0f' -w '#572020' -e --no-keyboard-layout --no-input-visualisation && \
i3lock -i /home/ben/Pictures/LockScreen.png -n -c '#000000' -o '#191d0f' -w '#572020' -e --no-keyboard-layout && \
xset s off

custom_xinitrc="$HOME/.custom_xinitrc" ; [ -e "$custom_xinitrc" ] && source "$custom_xinitrc"

exec i3
#exec awesome
#exec dwm
