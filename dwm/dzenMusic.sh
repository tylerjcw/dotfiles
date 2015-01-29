#!/bin/bash
XPOS="1085"
WIDTH="250"
LINES="3"

conky -c /home/komrade/etc/conky/mpdconkyrc | dzen2 -xs 1 -fg '#dcdcdc' -bg '#303030' -fn bitocra13 -x 1669 -y 970 -w 250 -h 16 -l 4 -ta l -e 'onstart=uncollapse;button1=exit;button3=exit'
