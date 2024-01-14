#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar
source $HOME/.config/custom_vars.sh

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do

		if xrandr --query | grep -q "$m connected primary"; then
			if [[ $HOSTNAME == $PC_HOSTNAME ]]; then
				MONITOR=$m polybar --reload main &
			else
				MONITOR=$m polybar --reload main-notebook &
			fi
    else
      MONITOR=$m polybar --reload secondary &
    fi

  done
else
  polybar --reload main &
fi
