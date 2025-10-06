#!/bin/bash
TOTAL_SECONDS=$(cat /tmp/timericon)
if [[ -z "$TOTAL_SECONDS" ]]; then
	exit 0
fi
MIN=$(printf "%02d" $((TOTAL_SECONDS / 60)))
SEC=$(printf "%02d" $((TOTAL_SECONDS % 60)))
printf "%s %s\n" $MIN $SEC
