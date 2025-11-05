#!/bin/bash

# Use upower to fetch battery info (works on laptops)
BAT=$(upower -i $(upower -e | grep BAT) | grep -E "percentage" | awk '{print $2}')

# Optionally, fetch charging status
STATUS=$(upower -i $(upower -e | grep BAT) | grep state | awk '{print $2}')

if [[ "$STATUS" == "charging" ]]; then
    echo "⚡ $BAT"
else
    echo "🔋 $BAT"
fi
