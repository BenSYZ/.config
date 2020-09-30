#!/bin/bash
sudo echo 
read -t 5 -p "Open Bluetooth? [y/n]" checking
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
