#!/usr/bin/env bash

lazygit

zellij action toggle-floating-panes

zellij action write 27 # send <Escape> key
zellij action write-chars ':redraw'
zellij action write 13 # send <Enter> key

zellij action write 27 # send <Escape> key
zellij action write-chars ':reload-all'
zellij action write 13 # send <Enter> key
