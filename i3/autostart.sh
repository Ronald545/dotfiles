#/bin/sh
nitrogen --restore  &&
picom && 
nm-applet && 
blueman-applet && 
dunst && 
~/.config/polybar/launch.sh &&
ibus-daemon --xim -d && 
/home/ronald/.profile

