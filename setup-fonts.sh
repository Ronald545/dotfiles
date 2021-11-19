#!/bin/sh

wget https://github.com/be5invis/Iosevka/releases/download/v11.0.1/super-ttc-iosevka-11.0.1.zip
unzip super-ttc-iosevka-11.0.1.zip && rm super-ttc-iosevka-11.0.1.zip

mkdir ~/.fonts
cp ./fonts/*.ttf ~/.fonts
fc-cache -f -v

echo "fonts installed :0, please manually move iosevka.tcc into the fonts folder and run fc-cache -f -v again"
