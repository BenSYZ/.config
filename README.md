# My config
This repository is mainly about `i3`, `alacritty` and shells.
## fonts

### My fonts
[Source Code Pro](https://github.com/ryanoasis/nerd-fonts/releases)

### Emoji

```sh
yay -S ttf-linux-libertine ttf-inconsolata ttf-joypixels ttf-twemoji-color noto-fonts-emoji ttf-liberation ttf-droid
```

### Chinese

```sh
yay -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei adobe-source-han-mono-cn-fonts adobe-source-han-sans-cn-fonts adobe-source-han-
```

### Input method


Install: `fcitx` `fcitx-im` `fcitx-googlepinyin` `fcitx-configtool`

And in `/etc/X11/xinit/xinitrc`:

```
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
```

### sway need
swaylock: i3lock
grim: import
swayidle: xautolock
