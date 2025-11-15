#!/usr/bin/env bash
# Auto-rotate Hyprland display + touchscreen from accelerometer events

# Prevent duplicates if Hyprland reloads the config
if pgrep -f "auto-rotate.sh" | grep -vq "$$"; then
  exit 0
fi

LOG="$HOME/.local/share/auto-rotate.log"
mkdir -p "$(dirname "$LOG")"
: > "$LOG"

DISPLAY_DEVICE="eDP-1"
hyprctl keyword input:touchdevice:output "$DISPLAY_DEVICE"

monitor-sensor | while read -r line; do
  echo "$line" >> "$LOG"
  case "$line" in
    *"Accelerometer orientation changed: normal"*)
      hyprctl keyword monitor "$DISPLAY_DEVICE",preferred,auto,1,transform,0
      hyprctl keyword input:touchdevice:transform 0
      ;;
    *"Accelerometer orientation changed: right-up"*)
      # Swapped: right-up should be 270° (transform 3) on your device
      hyprctl keyword monitor "$DISPLAY_DEVICE",preferred,auto,1,transform,3
      hyprctl keyword input:touchdevice:transform 3
      ;;
    *"Accelerometer orientation changed: bottom-up"*)
      hyprctl keyword monitor "$DISPLAY_DEVICE",preferred,auto,1,transform,2
      hyprctl keyword input:touchdevice:transform 2
      ;;
    *"Accelerometer orientation changed: left-up"*)
      # Swapped: left-up should be 90° (transform 1) on your device
      hyprctl keyword monitor "$DISPLAY_DEVICE",preferred,auto,1,transform,1
      hyprctl keyword input:touchdevice:transform 1
      ;;
  esac
done

