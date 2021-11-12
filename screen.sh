#!/bin/bash

SELECTION=${1:-on}

if [ "$SELECTION" = "on" ] ; then
    xrandr --output HDMI-1 --left-of eDP-1 --auto
else
    xrandr --output HDMI-1 --off
fi
