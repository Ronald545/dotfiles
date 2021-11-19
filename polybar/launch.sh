#!/bin/bash

# Terminate already running bar instances
pkill -x polybar

# Launch Polybar, using default config location ~/.config/polybar/config
polybar mainbar-i3 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
