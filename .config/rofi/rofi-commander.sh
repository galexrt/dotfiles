#!/bin/bash

main() {
    if [ -n "$1" ]; then
        if [ "$1" = "MAIN" ]; then
            exec rofi -theme sidebar -show commander -modi commander:"$HOME/.config/rofi/rofi-commander.sh"
        else
            if [ ! -x "$HOME/.commander/$1" ]; then
                echo "commander $1 not found or not executable."
                exit 1
            fi
            echo "" > "/tmp/rofi-$1-state"
            echo rofi -theme sidebar -show "$1" -modi "$1":"$HOME/.commander/$1" > /tmp/rofi-commander-cmd
            chmod u+x /tmp/rofi-commander-cmd
            exit 0
        fi
    fi

    for cmd in ~/.commander/*; do
        echo "$(basename "$cmd")"
    done
    exit 0
}

if [ -f /tmp/rofi-commander-cmd ]; then
    /tmp/rofi-commander-cmd
    rt=$?
    rm -f /tmp/rofi-commander-cmd
    exit $rt
fi

main "$@"

exit 0
