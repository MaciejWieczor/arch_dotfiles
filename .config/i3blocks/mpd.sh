#!/bin/bash

TRACK=$(mpc current)
PAUSE=$(mpc)
if [[ $TRACK ]]; then
	if [[ $PAUSE == *paused* ]]; then
		printf "%s" " "
	else
		printf "%s" " "
	fi
	printf "%s%s\n" "  " "$TRACK "
else
	printf "%s\n" "No Music"
fi
