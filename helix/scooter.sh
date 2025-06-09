#!/usr/bin/env bash

search_text=${1}

if [ -n "${search_text}" ]; then
	scooter --hidden -i --search-text "${search_text}" --immediate-search
else
	scooter --hidden -i
fi

zellij action toggle-floating-panes

zellij action write 27 # send <Escape> key
zellij action write-chars ':redraw'
zellij action write 13 # send <Enter> key

zellij action write 27 # send <Escape> key
zellij action write-chars ':reload-all'
zellij action write 13 # send <Enter> key
