#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    # echo ""
    echo "≋巠"
elif [ "$player_status" = "Paused" ]; then
    echo " 凍"
else
    echo "≋澂"
fi
