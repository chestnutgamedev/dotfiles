#!/bin/bash

# OBS Pause/Unpause Recording Script using obs-cmd

# Check if OBS is running
if ! pgrep -x "obs" > /dev/null; then
    notify-send "OBS Error" "OBS Studio is not running"
    exit 1
fi

# Get current recording status
STATUS=$(obs-cmd recording status 2>&1)

# Check if recording is active
if echo "$STATUS" | grep -q "Active: true"; then
    # Check if recording is paused
    if echo "$STATUS" | grep -q "Paused: true"; then
        # Recording is paused, so resume it
        obs-cmd recording resume
        notify-send "OBS Recording" "Resumed ▶"
    elif echo "$STATUS" | grep -q "Paused: false"; then
        # Recording is active and not paused, so pause it
        obs-cmd recording pause
        notify-send "OBS Recording" "Paused ⏸"
    fi
else
    # Not recording at all
    notify-send "OBS Error" "Recording is not active. Start recording first."
fi
