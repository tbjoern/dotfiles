#!/bin/bash

tmux split-window -h 'watch -n 0.5 "sensors | head -n 7"'
tmux split-window -v -t 1 'watch -n 0.5 grep MHz /proc/cpuinfo' 
htop
