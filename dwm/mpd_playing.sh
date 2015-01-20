#!/bin/zsh

if [[ -z $(mpc status | grep "playing") ]]; then
	echo "^i(/home/komrade/etc/dwm/icons/play1.xbm)"
else
	echo "^i(/home/komrade/etc/dwm/icons/pause1.xbm)"
fi