#!/bin/sh

#awk '{print $1" "$2" "$3" "$4}' < /proc/loadavg
cpupower frequency-info -fm | grep -oP '(?<=frequency: )([^ ]+ [^ ]+)'
