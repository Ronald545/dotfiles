#/bin/sh
~/.config/polybar/launch.sh &&
nitrogen --restore  &&
ibus-daemon --xim -d && 
/home/ronald/.profile && 
nm-applet && blueman-applet && picom && dunst
