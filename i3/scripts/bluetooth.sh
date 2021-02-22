#!/bin/bash


#ps -ef |grep "alacritty --dimensions 60 8 --position 50 50 --title BLUETOOTH -e ~/.config/i3/scripts/bluetooth.sh" |awk '{print $2}' |xargs kill
EXIST=$(ps -ef |grep "alacritty .* --title BLUETOOTH" |grep -v "grep"|wc -l)
if [[ $EXIST -gt 1 ]]; then
	exit 0
fi

read -t 5 -p "`echo $' \nOpen Bluetooth? [y/n]'`" checking
checking=${checking:-"n"}
if [[ $checking == "y" ]]; then
	sudo rfkill unblock bluetooth
	sudo systemctl start bluetooth
	echo -e "power on\n" | bluetoothctl
	/usr/lib/bluetooth/obexd -n -r ~/Downloads/bluetooth -a
	echo -e "power off\n" | bluetoothctl
	sudo systemctl stop bluetooth
	sudo rfkill block bluetooth
	# power on
	# scan on
	# pair <device>
fi

