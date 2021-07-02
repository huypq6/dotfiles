#!/bin/sh

Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)

BLUR="5x4"

PICTURE=/home/huypq6/Pictures/wallpapers/lock-wallpaper.png
LOCKPICTURE=~/.cache/lockscreen.png

# Convert to current monitor screen size
convert $PICTURE -blur $BLUR -resize "${Xaxis}x${Yaxis}" $LOCKPICTURE

# Render lock screen
i3lock --nofork                 	\
    --ignore-empty-password		\
    \
    --indicator				\
    --bar-indicator			\
    --bar-pos="($Yaxis-10)"		\
    --bar-base-width="10"		\
    --bar-orientation=horizontal	\
    --bar-color=2e3440			\
    --verif-color=88c0d0		\
    --wrong-color=bf616a		\
    --bshl-color=5e81ac			\
    --keyhl-color=a3be8c			\
    \
    --clock				\
    --time-color=eceff4ff		\
    --time-str="%I:%M %p"		\
    --time-font="Calvin and Hobbes"	\
    --time-size=150			\
    --time-pos="($Xaxis-420):($Yaxis-205)"		\
    --time-color=2e3440ff		\
    \
    --date-color=d8dee9ff		\
    --date-str="%A, %d %B"		\
    --date-color=2e3440ff		\
    --date-font="Calvin and Hobbes"	\
    --date-size=95			\
    --date-pos="tx:($Yaxis-60)"	\
    \
    --verif-font="Calvin and Hobbes"	\
    --verif-size=150			\
    --verif-text="Welcome home!"		\
    --wrong-font="Calvin and Hobbes"	\
    --wrong-size=150			\
    --wrong-text="No Entry!"		\
    \
    --image=$LOCKPICTURE

rm $LOCKPICTURE

