#!/bin/zsh
link_files=(".bashrc" ".npmrc" ".xinitrc" ".Xresources" ".condarc")
for f in $link_files;do
    echo $f
    ln -s "$HOME/.config/HOME/$f"  "$HOME"/
done

ln -s "$HOME/.config/zsh/zshrc"     "$HOME"/.zshrc
ln -s "$HOME/.config/zsh/zprofile"  "$HOME"/.zprofile
