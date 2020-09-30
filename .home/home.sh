cd ../../
ln -s ./.config/.home/.bashrc ./
ln -s ./.config/.home/.gitconfig ./
ln -s ./.config/.home/keys.conf ./
ln -s ./.config/.home/.npmrc ./
ln -s ./.config/.home/.pip ./
ln -s ./.config/.home/.xinitrc ./
ln -s ./.config/.home/.xmodmap_colemak ./
ln -s ./.config/.home/.xmodmap_qwert ./
ln -s ./.config/.home/.Xresources ./
ln -s ./.config/.home/.zshrc ./


if [ -d "./.oh-my-zsh/themes/" ]; then
	#echo hello
	ln -s ./.config/.home/.oh-my-zsh/themes/ben.zsh-theme ./.oh-my-zsh/themes/
else
	echo 'WARNING: Install oh-my-zsh first'
fi

sudo ln -s ../i3blocks/battery.sh /usr/bin/battery
