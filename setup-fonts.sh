#!/bin/sh

mkdir ~/.fonts
cp ./fonts/*.ttf ~/.fonts
fc-cache -f -v

echo "3 fonts installed :0"
