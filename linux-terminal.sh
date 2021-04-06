#!/bin/sh
if [ ! -n "${TERMINAL+1}" ]; then
	if command -v "kitty" &> /dev/null;then
	    TERMINAL="kitty"
	elif command -v "konsole" &> /dev/null; then
		TERMINAL="konsole --hide-menubar -e"
	elif command -v "gnome-terminal" &> /dev/null; then
		TERMINAL="gnome-terminal -x"
	fi
fi

$TERMINAL "$@" 2>/dev/null