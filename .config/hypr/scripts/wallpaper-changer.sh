#!/bin/bash

# WALLPAPERS PATH
DIR=$HOME/Wallpapers/

# Transition config (type awww img --help for more settings
FPS=320
TYPE="grow"
DURATION=2

# wofi window config (in %)
WIDTH=20
HEIGHT=30

awww_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"

PICS=($(ls ${DIR} | grep -e ".jpg$" -e ".jpeg$" -e ".png$" -e ".gif$"))

RANDOM_PIC=${PICS[$RANDOM % ${#PICS[@]}]}
RANDOM_PIC_NAME="${#PICS[@]}. random"

# wofi STYLES
CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"
COLORS="$HOME/.cache/wal/colors-wofi-dark.rasi"

# to check if swaybg is running

if [[ $(pidof swaybg) ]]; then
    pkill swaybg
fi

## wofi Command
wofi_command="wofi --show dmenu \
			--prompt choose...
			--conf $CONFIG --style $STYLE --color $COLORS \
			--width=$WIDTH% --height=$HEIGHT% \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--matching=fuzzy"

menu() {
    # Here we are looping in the PICS array that is composed of all images in the $DIR
    # folder
    for i in ${!PICS[@]}; do
        # keeping the .gif to make sue you know it is animated
        if [[ -z $(echo ${PICS[$i]} | grep .gif$) ]]; then
            printf "$i. $(echo ${PICS[$i]} | cut -d. -f1)\n" # n°. <name_of_file_without_identifier>
        else
            printf "$i. ${PICS[$i]}\n"
        fi
    done

    printf "$RANDOM_PIC_NAME"
}

awww query || awww-daemon

main() {
    choice=$(menu | ${wofi_command})

    # no choice case
    if [[ -z $choice ]]; then return; fi

    # random choice case
    if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
        awww img ${DIR}/${RANDOM_PIC} $awww_PARAMS
        return
    fi

    pic_index=$(echo $choice | cut -d. -f1)
    awww img ${DIR}/${PICS[$pic_index]} $awww_PARAMS
    wal -i ${DIR}/${PICS[$pic_index]} -n
    cp "${DIR}/${PICS[$pic_index]}" "$HOME/.cache/current_wallpaper.jpg"
}

# Check if wofi is already running
if pidof wofi >/dev/null; then
    killall wofi
    exit 0
else
    main
fi

# Uncomment to launch something if a choice was made
# if [[ -n "$choice" ]]; then
# Restart Waybar
# fi
