#!/bin/zsh
link_files=(".bashrc" ".npmrc" ".xinitrc" ".Xresources" ".zshrc" ".condarc" ".zprofile")
for f in $link_files;do
    echo $f
    ln -s "$HOME/.config/HOME/$f"  "$HOME"/
done
