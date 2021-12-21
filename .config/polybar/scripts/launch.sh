#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch middle and right bars
echo "---" | tee -a /tmp/polybar-right.log /tmp/polybar-middle.log /tmp/polybar-left.log
polybar right 2>&1 | tee -a /tmp/polybar-right.log & disown
polybar middle 2>&1 | tee -a /tmp/polybar-middle.log & disown
polybar left 2>&1 | tee -a /tmp/polybar-left.log & disown

echo "Bars launched..."
