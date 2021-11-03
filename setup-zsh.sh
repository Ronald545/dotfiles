#!/bin/sh
# this script assumes that you have zsh installed using a package manager already

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install zsh syntax highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# remember to update your zshrc

# update theme: ZSH_THEME="powerlevel10k/powerlevel10k"

# update plugins: plugins=(
# git
# zsh-syntax-highlighting 
# ...
# )
echo "zsh plugins installed, remember to update ~/.zshrc"
