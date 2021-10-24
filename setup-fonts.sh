#!/bin/sh

mkdir ~/.fonts
cp ./fonts/*.ttf ~/.fonts
fc-cache -f -v
