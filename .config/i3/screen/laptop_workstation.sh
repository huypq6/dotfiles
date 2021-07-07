#!/bin/bash

# Workstation Mode
# DP1 is DELL U2518D, as a primary screen. 
# DP2 is DELL 24inch screen, as a secondary screen, with portrait view
#  ___________
#  |          |       ________________________
#  |          |      |                        |
#  |          |      |                        |
#  |   DP2    |      |       DP1              |
#  |          |      |                        |
#  |          |      |                        |
#  |          |      |________________________|
#  |__________|

xrandr --output DP1 --auto --primary
xrandr --output DP2 --mode 1920x1080 --rotate left --left-of DP1
