#!/bin/bash

chosen=$(echo -e "[Cancel]\nLaptop\nMonitor\nDocked" | rofi -dmenu -i)
# Info about some states are available here:
# https://www.freedesktop.org/software/systemd/man/systemd-sleep.conf.html#Description

if [[ $chosen = "Laptop" ]]; then
	~/.screenlayout/notdocked.sh
elif [[ $chosen = "Monitor" ]]; then
    echo ''
elif [[ $chosen = "Docked" ]]; then
    ~/.screenlayout/newestdocked.sh
fi
