#!/bin/bash

#scrot -z -e 'mv $f /tmp/i3lock.png'
scrot -z /tmp/i3lock.png
convert /tmp/i3lock.png -blur 5x10 /tmp/i3lock.png
i3lock -i /tmp/i3lock.png -n -c '#000000' -o '#191d0f' -w '#572020' -e && rm /tmp/i3lock.png &
## -l '#ffffff' waiting


