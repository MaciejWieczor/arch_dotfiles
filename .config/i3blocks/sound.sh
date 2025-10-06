#!/bin/bash

MUTE=$(pactl get-sink-mute @DEFAULT_SINK@)
printf "%s" "Sound: "
if [[ $MUTE == *yes* ]]; then
	printf "%s\n" "Mute"
else
	pactl get-sink-volume 0 | grep -E -o '[0-9][0-9][0-9]?%' | head -1
fi
