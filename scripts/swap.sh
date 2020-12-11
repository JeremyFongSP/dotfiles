#!/bin/sh

current_container=$(i3-msg -t get_tree | json_reformat | grep -10 '"focused": true' | grep '"id":' | sed 's/[^0-9]*//g')
sleep 1
# i3-msg swap with id $current_window
i3-msg swap container with con_id $current_container

