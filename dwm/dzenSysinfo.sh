#!/bin/bash
XPOS="1400"
WIDTH="360"
LINES="30"

highlight="#98CBFE"

cputemp=$(sensors | grep "temp1" | cut -d'+' -f2 | head -c2)F
cpuutiluser=$(iostat -c | sed -n "4p" | awk -F " " '{print $1}')
cpuutilsystem=$(iostat -c | sed -n "4p" | awk -F " " '{print $3}')
cpuutilidle=$(iostat -c | sed -n "4p" | awk -F " " '{print $6}')
ramtotal=$(free -m | sed -n "2p" | awk -F " " '{print $2}')
ramused=$(free -m | sed -n "2p" | awk -F " " '{print $3}')

hostname=$(uname -n)
uptime=$(uptime | sed -n "1p" | awk -F "," '{print $1}')
kernel=$(uname -r)
packages=$(pacman -Q | wc -l)

hdd1=$(df -h | grep "/dev/sd" | sed -n "1p")

hddtitle=$(df -h | head -1)
hddtotal=$(df -h --total | tail -1)
toptitle=$(top -bn1 | grep PID | cut -b1-5,42-) 
top=$(top -bn1 -U 'komrade' | tail -n+8 | sort -k9nr -k10nr | cut -b1-5,42- | head -n8)

interface=$(ifconfig wls3 | sed -n 1p | awk '{print $1}' | sed 's|:||g')
mac=$(ifconfig wls3 | awk '/ether/ {print $2}')
inet=$(ifconfig wls3 | sed -n "2p" | awk -F " " '{print $2}')
extip=$(curl ipv4.icanhazip.com)
#extip6=$(curl ipv6.icanhazip.com)
netmask=$(ifconfig wls3 | sed -n "2p" | awk -F " " '{print $4}')
broadcast=$(ifconfig wls3 | sed -n "2p" | awk -F " " '{print $6}')

(echo " ^fg($highlight)System"; echo " Temp: ^fg($highlight)$cputemp"; echo " CPU User : ^fg($highlight)$cpuutiluser %"; echo " CPU System : ^fg($highlight)$cpuutilsystem %"; echo " Idle: ^fg($highlight)$cpuutilidle %"; echo " RAM: ^fg($highlight)$ramused MB / $ramtotal MB"; echo " "; echo " Hostname: ^fg($highlight)$hostname"; echo " Uptime: ^fg($highlight)$uptime"; echo " Kernel: ^fg($highlight)$kernel"; echo " Packages: ^fg($highlight)$packages"; echo " ";  echo "^fg($highlight)$toptitle"; echo "$top"; echo " ";echo " ^fg($highlight)$hddtitle"; echo " $hdd1"; echo " $hddtotal"; echo ""; echo " Interface: ^fg($highlight)wls3"; echo " IP: ^fg($highlight)$inet"; echo " IPv4: ^fg($highlight)$extip"; echo " Netmask: ^fg($highlight)$netmask";  echo " Broadcast: ^fg($highlight)$broadcast"; echo " MAC: ^fg($highlight)$mac"; echo "";) | dzen2 -xs 1 -p -fg '#FFFFFF' -bg '#303030' -fn bitocra -x 643 -y 740 -w 380 -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'