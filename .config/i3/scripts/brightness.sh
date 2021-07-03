#!/bin/bash


BRIGHT=$(xrandr --verbose | grep -i brightness | head -n 1 | cut -d" " -f2)


function set_bright {
	(xrandr --output eDP1 --brightness $1)
}

if [ "$1" = '+' ]; then
    NEWBRIGHT=$(echo "$BRIGHT + 0.05" | bc)
    if [ "$(echo "$NEWBRIGHT > 1.0" | bc)" -eq 1 ]; then
        NEWBRIGHT='1.0'
    fi
	set_bright $NEWBRIGHT
elif [ "$1" = '-' ]; then
    NEWBRIGHT=$(echo "$BRIGHT - 0.05" | bc)
    if [ "$(echo "$NEWBRIGHT < 0.2" | bc)" -eq 1 ]; then
        NEWBRIGHT='0.2'
    fi
	set_bright $NEWBRIGHT
fi
