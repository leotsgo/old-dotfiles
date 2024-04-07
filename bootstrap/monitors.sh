#!/bin/bash


input=$(hyprctl monitors)

awk '/Monitor/ {match($0, /Monitor[[:space:]]*([^[:space:]]+)/, arr); print arr[1]}' <<< "$input" |
while read -r monitor_name; do
    if [ "$monitor_name" == "HDMI-A-1" ]; then
        hyprctl keyword monitor "eDP-1, disable"
    else
        # hyprctl keyword monitor "eDP-1, enable"
        hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1"
    fi
done





