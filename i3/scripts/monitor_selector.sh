#!/bin/bash

chosen=$(echo -e "[Cancel]\nLaptop\nRight Monitor (standard)\nLeft Monitor (4k vertical)\nLeft Monitor (standard)\nHome Docked\nDocked" | rofi -dmenu -i)
# Info about some states are available here:
# https://www.freedesktop.org/software/systemd/man/systemd-sleep.conf.html#Description

if [[ $chosen = "Laptop" ]]; then
	~/.config/screenlayout/notdocked.sh
elif [[ $chosen = "Right Monitor (standard)" ]]; then
	~/.config/screenlayout/right_monitor.sh
elif [[ $chosen = "Left Monitor (4k vertical)" ]]; then
	~/.config/screenlayout/vertical_4k.sh
elif [[ $chosen = "Left Monitor (standard)" ]]; then
	~/.config/screenlayout/left_monitor.sh
elif [[ $chosen = "Home Docked" ]]; then
    ~/.config/screenlayout/docked_home.sh
elif [[ $chosen = "Docked" ]]; then
    ~/.config/screenlayout/newestdocked.sh
fi

sleep 5
nitrogen --set-zoom-fill ~/.config/i3/images/background.png
