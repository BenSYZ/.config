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

fcitx5 &
# notification
dunst &
xset s 0 -dpms &

exec i3
#exec awesome
#exec dwm
