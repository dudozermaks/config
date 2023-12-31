#!/usr/bin/env bash
# Script switches default sink output to the next one. Made for PulseAudio
# dependencies: awk, grep, pactl (as far as I know it comes with PulseAudio).

# This script was partially made using AI (I am newbie in bash). If you have any suggestions, feel free to share.

active_port=$(pactl list sinks | grep -m1 -oP '(?<=Active Port: ).*')

# Read port names into an array
mapfile -t ports < <(pactl list sinks | awk '/Ports:/,/Active Port:/' | grep -v 'Active Port:' | grep -oP 'analog-output-\w+')

next=0

for i in "${!ports[@]}"; do
	if [[ "${ports[$i]}" = "${active_port}" ]]; then
		if [[ "$i" -ne $((${#ports[@]}-1)) ]]; then
			next=$((i+1))
		fi
		break
	fi
done

pactl set-sink-port $(pactl get-default-sink) ${ports[next]}
