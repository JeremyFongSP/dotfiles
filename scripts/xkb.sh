#!/bin/sh

setxkbmap -layout us
setxkbmap -option caps:escape
setxkbmap -option shift:both_capslock
notify-send Keyboard "Keys set successfully" -i ~/.icons/elenapan/linebit/keyboard.png
