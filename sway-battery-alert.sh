#!/bin/sh

# CONFIGURATION
BATTERY="BAT0"                     # Change to BAT1 if your system uses it
BOTTOM_THRESHOLD=20                   # Threshold percentage to turn the bar red
TOP_THRESHOLD=80                   # Threshold percentage to turn the bar red

CHECK_INTERVAL=1                  # How often to check in seconds

# BAR COLORS (Hex format)
COLOR_NORMAL="#1d2021"             # Your default status bar background color
RED_ALERT="#cc241d"              # Bright red for low battery alert
GREEN_ALERT="#00bb00"              # Bright red for low battery alert

# Track the last applied state to avoid spamming swaymsg
LAST_STATE="NORMAL"

while true; do
    if [ -d "/sys/class/power_supply/$BATTERY" ]; then
        CAPACITY=$(cat "/sys/class/power_supply/$BATTERY/capacity")
        STATUS=$(cat "/sys/class/power_supply/$BATTERY/status")

        # Trigger alert if discharging AND below or equal to threshold
        if [ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -le "$BOTTOM_THRESHOLD" ]; then
            if [ "$LAST_STATE" != "ALERT" ]; then
                # Update all connected bars to the alert background color
                echo "HIHI"
                swaymsg "bar bar-0 colors background '$RED_ALERT'"
                LAST_STATE="ALERT"
            fi
            break
        elif [ "$STATUS" = "Charging" ] && [ "$CAPACITY" -gt "$TOP_THRESHOLD" ]; then
            if [ "$LAST_STATE" != "ALERT" ]; then
                # Update all connected bars to the alert background color
                echo "HIHI"
                swaymsg "bar bar-0 colors background '$GREEN_ALERT'"
                LAST_STATE="ALERT"
            fi
            break
        else
            if [ "$LAST_STATE" != "NORMAL" ]; then
                # Restore the clean default background color
                swaymsg "bar bar-0 colors background '$COLOR_NORMAL'"
                LAST_STATE="NORMAL"
            fi
            break
        fi
    fi
    sleep "$CHECK_INTERVAL"
done
