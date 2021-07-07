#!/bin/bash

# Presentation Mode
# eDP1 is built in screen
# HDMI2 is external screen  
#                    __________________________
#                    |                        |
#   __________       |                        |
#  |          |      |                        |
#  |   eDP1   |      |       HDMI2            |
#  |          |      |                        |
#  |__________|      |                        |
#                    |________________________|

xrandr --output DP1 --auto --primary
xrandr --output DP2 --mode 1920x1080 --rotate left --left-of DP1
