#!/bin/sh

STATUS=$(sudo nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)

if [ "$STATUS" = "Connected" ]; then
    # echo "%{F#82E0AA}%{A1:nordvpn d:}$(sudo nordvpn status | grep City | cut -d ':' -f2)%{A}%{F-}"
    COUNTRY=$(sudo nordvpn status | grep Country | cut -d ':' -f2)
    if [[ "$COUNTRY" == *"Canada"* ]]; then
        echo "CAN"
    elif [[ "$COUNTRY" == *"United States"* ]]; then
        echo "USA"
    else
        echo $COUNTRY
    fi
else
    echo ""
fi
