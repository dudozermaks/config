#! /usr/bin/env bash
PC_HOSTNAME="DM"
NOTEBOOK_HOSTNAME="DMnotebook"
HOSTNAME=$(cat /proc/sys/kernel/hostname)

if [[ $HOSTNAME == $PC_HOSTNAME ]]; then
	SHIT_FOLDER="$HOME/shit"
	WALLPAPERS_FOLDER="$HOME/.config/wallpapers"
else
	SHIT_FOLDER="$HOME/shit"
	WALLPAPERS_FOLDER="$HOME/.config/wallpapers"
fi
