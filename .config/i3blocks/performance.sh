#!/bin/bash

PROFILE=$(cat /sys/firmware/acpi/platform_profile)

case $PROFILE in
	"performance")
		ACTIVE_PROFILE="P"
		;;
	"cool")
		ACTIVE_PROFILE="C"
		;;
	"balanced")
		ACTIVE_PROFILE="B"
		;;
	"quiet")
		ACTIVE_PROFILE="Q"
		;;
esac

printf "%s\n" $ACTIVE_PROFILE
