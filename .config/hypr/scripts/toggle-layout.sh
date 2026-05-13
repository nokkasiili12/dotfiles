#!/bin/bash

CURRENT=$(hyprctl devices -j | jq -r '.keyboards[0].active_keymap')

if [[ "$CURRENT" == *"English (US)"* ]] || [[ "$CURRENT" == *"us"* ]]; then
    hyprctl eval 'hl.config({input = {kb_layout = "fi"}})'
    notify-send "Keyboard Layout" "Switched to Finnish (fi)"
else
    hyprctl eval 'hl.config({input = {kb_layout = "us"}})'
    notify-send "Keyboard Layout" "Switched to US (us)"
fi
