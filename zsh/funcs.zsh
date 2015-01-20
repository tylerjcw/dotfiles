function makedwm()
{
    (pushd $HOME/code/dwm; makepkg -efi --skipinteg --noconfirm; popd) &> /dev/null
}

function makestatus()
{
    pushd $HOME/code/dwmstatus &> /dev/null
    gcc -o dwmstatus dwmstatus.c
    popd &> /dev/null
    pkill dzen2
    sleep 1
    cp $HOME/code/dwmstatus/dwmstatus $HOME/bin/dwmstatus
    $HOME/etc/dwm/dwmstatus.sh & disown
}

function maketabbed()
{
    (pushd $HOME/code/tabbed; makepkg -efi --skipinteg --noconfirm; popd) &> /dev/null
}

function makesurf()
{
    (pushd $HOME/code/surf; makepkg -efi --skipinteg --noconfirm; popd)  &> /dev/null
}