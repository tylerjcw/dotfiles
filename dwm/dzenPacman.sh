#!/bin/bash
XPOS="1620"
WIDTH="275"
pacmanlines=$(pacman -Qu | wc -l)
LINES=$(( $pacmanlines + 2 ))

echo $pacmanlines > $HOME/log/updates.log

updates=$(pacman -Qu | sed -e 's/-> /^fg(#A3D572)/g' | column -tx)

(echo "^fg(#98CBFE)Updates"; echo "$updates"; echo " "; echo "^fg(#98CBFE)Click to exit") | dzen2 -xs 1 -p -fg '#FFFFFF' -bg '#303030' -fn bitocra -x 748 -y 740 -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'
