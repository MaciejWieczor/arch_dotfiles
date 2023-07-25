#!/bin/sh
intern=eDP-1
extern=HDMI-1-0

if xrandr | grep "$extern disconnected"; then
    killall feh
    xrandr --output "$extern" --off --output "$intern" --auto
    feh --bg-fill /home/maciej/Obrazy/wallpapers/1.png
    # /bin/bash /home/maciej/.config/polybar/launch.sh
else
    killall feh
    # xrandr --output "$intern" --auto --output "$extern" --auto --right-of "$intern"
    xrandr --output "$extern" --auto --right-of "$intern"
    feh --bg-fill /home/maciej/Obrazy/wallpapers/1.png
    polybar HDMI11
    # /bin/bash /home/maciej/.config/polybar/launch_tm.sh
    xset r rate 300 50
fi
