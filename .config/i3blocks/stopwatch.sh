#!/bin/bash
TOTAL_SECONDS=$(cat /tmp/stopwatch)
STATUS=$(cat /tmp/stopwatch_status)
if [[ "$TOTAL_SECONDS" -le 0 ]]; then
	exit 0
fi

HRS=$(printf "%02d" $((TOTAL_SECONDS / 3600)))
MIN=$(printf "%02d" $(((TOTAL_SECONDS % 3600) / 60)))
SEC=$(printf "%02d" $((TOTAL_SECONDS % 60)))
STATUS_STRING=""
if [ $STATUS = "RUNNING" ]; then
	STATUS_STRING=" "
else
	STATUS_STRING=" "
fi
printf "%s %s %s:%s:%s \n" "stoper" $STATUS_STRING $HRS $MIN $SEC
