#!/usr/bin/env bash

class=$(playerctl metadata --player=spotify_player --format '{{status}}' 2>/dev/null | tr '[:upper:]' '[:lower:]')

icon=" "
text=""

if [[ "$class" == "playing" ]]; then
    info=$(playerctl metadata --player=spotify_player --format '{{artist}} - {{title}}' 2>/dev/null)

    if ((${#info} > 120)); then
        info="${info:0:120}..."
    fi
    text=$icon" "$info
elif [[ $class == "paused" ]]; then
    text=$icon
elif [[ $class == "stopped" ]]; then
    text=""
fi
echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"
