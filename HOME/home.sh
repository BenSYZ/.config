ln -s $HOME/.config/HOME/.bashrc $HOME/
ln -s $HOME/.config/HOME/.npmrc $HOME/
ln -s $HOME/.config/HOME/.xinitrc $HOME/
ln -s $HOME/.config/HOME/.Xresources $HOME/
ln -s $HOME/.config/HOME/.zshrc $HOME/
ln -s $HOME/.config/HOME/.condarc $HOME/


if [ -d "./.oh-my-zsh/themes/" ]; then
	ln -s $HOME/.config/zsh/ben.zsh-theme $HOME/.oh-my-zsh/themes/
else
	echo 'WARNING: Install oh-my-zsh first'
fi
