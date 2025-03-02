#!/bin/bash

result=$(xrandr --query | grep "HDMI-1-0 connected")
# This command will close all active conky
killall conky

sleep 1

if [ -n "$result" ]; then
    conky -c $HOME/.config/conky/Mintaka/Mintaka-primary-monitor.conf &> /dev/null &
    conky -c $HOME/.config/conky/Mintaka/Mintaka-second-monitor.conf &> /dev/null &
else
    conky -c $HOME/.config/conky/Mintaka/Mintaka-primary-monitor.conf &> /dev/null &
fi

exit
