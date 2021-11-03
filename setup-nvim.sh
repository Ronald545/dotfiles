#!/bin/sh
# this script assumes that you already have neovim installed using your package manager

# setup vim configuration
cp ./nvim ~/.config/

# vim plug installer
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# after doing this, open up vim and run :PlugInstall to install all the packages
# then run :CHADdeps

# NOTE: COC uses nodejs so have that installed aswell
echo "vim-plug installed, remember to copy the config file into ~/.config and run :PlugInstall"
