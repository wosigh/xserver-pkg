#!/bin/sh
#Launches the x server

#This script should be called from anything that wants/needs an X server
#Assumes 'DISPLAY' variable is /set/ to what we should launch the server on
#(invoke like: 'DISPLAY=:0.0 /path/to/this/file/start.sh')

#This is where the X server lives
APP_DIR=/media/cryptofs/apps/usr/palm/applications/org.webosinternals.xorg-server
KEYMAP_DIR=$APP_DIR/share/X11/xkb/keymap

export PATH=$APP_DIR/bin:$PATH
#Portrait orientation
Xsdl -noreset -nolisten tcp -retro -screen 320x480x24 $DISPLAY &
#Landscape
#Xsdl -noreset -nolisten tcp -retro -screen 480x320x24 $DISPLAY &

sleep 1
xkbcomp -R$KEYMAP_DIR palm-pre $DISPLAY

#XXX: Add code that runs ~/.xinitrc or /media/internal/xinitrc if it exists?

