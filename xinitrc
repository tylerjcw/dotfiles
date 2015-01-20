#Autostart Section
[[ -f $HOME/etc/xresources ]] && xrdb -merge $HOME/etc/xresources
start-pulseaudio-x11
wmname LG3D
numlockx on
nitrogen --restore
compton --config $HOME/etc/compton.conf &


xsetroot -name " "

while true; do
    ( sleep 2 & $HOME/etc/dwm/dwmstatus.sh ) &
    dwm &> $HOME/log/dwm.log
    pkill dwmstatus
    pkill dzen2
done
