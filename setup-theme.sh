#!/bin/bash

# Nordic Theme
git clone https://github.com/EliverLara/Nordic.git
sudo mv Nordic /usr/share/themes

# Papirus Icon Theme
wget -qO- https://git.io/papirus-icon-theme-install | sh

echo "Nordic theme installed ;)"
