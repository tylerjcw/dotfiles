#!/bin/bash
# 
# Dzen2 App Launcher
# -tw = Width of titlebar, -w = Width of slavewindow,
# -l = length of slavewindow. Remember to adjust -l accordingly when adding 
# apps.  
#
# Needed Applications:

ICONDIR=/home/komrade/etc/dwm/icons

ICM=$ICONDIR/dwm.xbm

IC1=$ICONDIR/shroom.xbm
AP1=google-chrome-stable
AN1="Chrome"

IC2=$ICONDIR/fox.xbm
AP2=gimp
AN2="GIMP"

IC3=$ICONDIR/edit2.xbm
AP3=subl
AN3="Sublime Text"

IC4=$ICONDIR/term1.xbm
AP4="tabbed -n term urxvt -embed"
AN4="Urxvt"

IC5=$ICONDIR/file1.xbm
AP5=pcmanfm
AN5="PCManFM"

# Deco:
DC1=3x26

#FONT
FONT="-*-bitocra-*-*-*-*-*-*-*-*-*-*-*-*"

# Colors:
FG1=#CFCFCF
FG2=#EFBD8B
FG3=#B58858
BG1=#303030
BG2=#6095C5

# Text passed to Dzen2
(echo "^fg(${FG2})^i(${ICM})"; echo -e "^fg(${FG1})\
^ca(1,${AP1})^fg(${BG2})^r(${DC1})^fg() ^fg(${FG3})^i(${IC1})^fg(${FG1}) ${AN1} ^pa(122)^fg(${BG2})^r(${DC1})^fg()^ca()\n\
^ca(1,${AP2})^fg(${BG2})^r(${DC1})^fg() ^fg(${FG3})^i(${IC2})^fg(${FG1}) ${AN2} ^pa(122)^fg(${BG2})^r(${DC1})^fg()^ca()\n\
^ca(1,${AP3})^fg(${BG2})^r(${DC1})^fg() ^fg(${FG3})^i(${IC3})^fg(${FG1}) ${AN3} ^pa(122)^fg(${BG2})^r(${DC1})^fg()^ca()\n\
^ca(1,${AP4})^fg(${BG2})^r(${DC1})^fg() ^fg(${FG3})^i(${IC4})^fg(${FG1}) ${AN4} ^pa(122)^fg(${BG2})^r(${DC1})^fg()^ca()\n\
^ca(1,${AP5})^fg(${BG2})^r(${DC1})^fg() ^fg(${FG3})^i(${IC5})^fg(${FG1}) ${AN5} ^pa(122)^fg(${BG2})^r(${DC1})^fg()^ca()")\
| (dzen2 -y '783' -x '658' -fn "$FONT" -bg ${BG1} -fg ${FG1} -l 5 -h 26 -tw 35 -w 125 -m -p -e 'onstart=uncollapse;leaveslave=exit;button1=menuexec;button2=exit;button3=exit;')