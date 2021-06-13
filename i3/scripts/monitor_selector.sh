#!/bin/bash

chosen=$(echo -e "[Cancel]\nLaptop\nMonitor\nDocked" | rofi -dmenu -i)
# Info about some states are available here:
# https://www.freedesktop.org/software/systemd/man/systemd-sleep.conf.html#Description

if [[ $chosen = "Laptop" ]]; then
	~/.config/screenlayout/notdocked.sh
elif [[ $chosen = "Left Monitor" ]]; then
	~/.config/screenlayout/left_monitor.sh
elif [[ $chosen = "Docked" ]]; then
    ~/.config/screenlayout/newestdocked.sh
fi

nitrogen --set-zoom-fill ~/.config/i3/images/background.png
