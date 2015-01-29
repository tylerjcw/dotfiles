#!/bin/zsh

function netup() #== Checks to see if network is up
{
    if [[ $(ip link | gawk '/3: wls3:/{print $9}')=='UP' ]]; then
        echo up
    else
        echo down
    fi
}

function testsshfs() #== Tests if server storage is mounted
{
    if [[ -n $(mount | gawk '/^komrade/{print $3}') ]]; then
        echo true
    else
        echo false
    fi
}

function testminesrv() #== Tests if server storage is mounted
{
    if [[ -n $(mount | gawk '/^minecraft/{print $3}') ]]; then
        echo true
    else
        echo false
    fi
}

function makedwm() #== Makes and Installs DWM with makepkg and pacman
{
    (pushd $HOME/code/dwm; makepkg -efi --skipinteg --noconfirm; popd) &> /dev/null
}

function makestatus() #== Compiles dwmstatus.c and copies the resulting binary to ~/bin
{
    pushd $HOME/code/dwmstatus &> /dev/null
    gcc -o dwmstatus dwmstatus.c
    popd &> /dev/null
    pkill dzen2
    sleep 1
    cp $HOME/code/dwmstatus/dwmstatus $HOME/bin/dwmstatus
    $HOME/etc/dwm/dwmstatus.sh & disown
}

function maketabbed() #== Makes and Installs tabbed with makepkg and pacman
{
    (pushd $HOME/code/tabbed; makepkg -efi --skipinteg --noconfirm; popd) &> /dev/null
}

function makesurf() #== Makes and Installs surf with makepkg and pacman
{
    (pushd $HOME/code/surf; makepkg -efi --skipinteg --noconfirm; popd)  &> /dev/null
}

function hexcol() #== Displays XResources colors in Hexidecimal format (#RRGGBB)
{
    xres="$HOME/etc/xresources"

    colors=( $( sed -re '/^!/d; /^$/d; /^#/d; s/(\.color)([0-9]):/\10\2:/g;' $xres | grep 'color[01][0-9]:' | sort | sed  's/^.*: *//g' ) )

    echo -e "\e[1;37m 
      BLK         RED         GRN         YLW         BLU         PNK         CYN         WHT   
───────────────────────────────────────────────────────────────────────────────────────────────────\e[0m"
    for i in {0..7}; do
        echo -en "\e[$((30+$i))m ██ ${colors[i+1]} \e[0m"
    done
    echo
    for i in {8..15}; do
        echo -en "\e[1;$((22+$i))m ██ ${colors[i+1]} \e[0m"
    done
        echo ""
}

function coltable() #== Displays the color table
{
    T='▉▉▉'   # The test text
    echo -e "\n          0m     40m     41m     42m     43m     44m     45m     46m     47m";
    for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m'            '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m'            '  36m' '1;36m' '  37m' '1;37m';
        do FG=${FGs// /}
        echo -en " $FGs \033[$FG  $T  "
        for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
            do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
        done
        echo;
    done
    echo ""
}
