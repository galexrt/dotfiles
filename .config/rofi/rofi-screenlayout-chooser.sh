#!/usr/bin/env bash

# Various options for the file browser script:
ROFI_SCREENLAY_OPENER="sh" # command used for opening the selection
ROFI_SCREENLAY_PREV_LAYOUT="$HOME/.local/share/rofi/rofi_screenlayout_prev"
# Comment the next variable to always start in the last visited directory,
# otherwise rofi_fb will start in the specified directory:
ROFI_SCREENLAY_LOCATION="$HOME/.screenlayout" # starting directory
ROFI_SCREENLAY_NITROGEN=true
ROFI_SCREENLAY_ARANDR=true

# Beginning of the script:
# Create the directory for the files of the script
if [ ! -d $(dirname "${ROFI_SCREENLAY_PREV_LAYOUT}") ]
then
    mkdir -p "$(dirname "${ROFI_SCREENLAY_PREV_LAYOUT}")"
    touch "${ROFI_SCREENLAY_PREV_LAYOUT}"
fi

# Handle argument.
if [ $# -ne 0 ]; then
    if [ "$1" == "Successfull!" ]; then
        exit
    elif [ "$1" == "arandr" ]; then
        coproc ( "arandr" & > /dev/null 2>&1 )
    else
        cd "$ROFI_SCREENLAY_LOCATION"
        coproc ( "${ROFI_SCREENLAY_OPENER}" "$1" & > /dev/null  2>&1 )
        if [ $ROFI_SCREENLAY_NITROGEN ]; then
            nitrogen --restore
        fi
    fi
    echo "$1" | sed 's/enable/disable/g' > "$ROFI_SCREENLAY_PREV_LAYOUT"
else
    cd "$ROFI_SCREENLAY_LOCATION"
    cat "$ROFI_SCREENLAY_PREV_LAYOUT"
    echo ""
    ls
    if [ $ROFI_SCREENLAY_ARANDR ]; then
        echo ""
        echo "arandr"
    fi
fi
exit;
# vim:sw=4:ts=4:et:
