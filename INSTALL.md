# Installation Guide

## Dependencies
can be installed using a package manager (apt, pacman, etc):
- i3-gaps (window manager)
- polybar (status bar)
- picom (compositor)
- dunst (notification manager)
- nitrogen (wallpaper setting)
- maim (screenshot taker)
- xclip (clipboard manager)
- zsh (unix shell)
- kitty (terminal emulator)
- git (version control)
- lxappearance (theme setter)

clone from https://git.suckless.org/dmenu:
- dmenu (application launcher)

optional dependencies include:
- nvim (text editor)
- ranger (terminal based file explorer)
- zathura (pdf viewer)
- htop (process viewer)

## Installation
Steps:
1. Install All Dependencies using a package manager
2. Install fonts and theme
`./setup-fonts.sh` will move 3 fonts into the fonts folder,
due to the size of iosevka, you will have to manually move it to the ~/.fonts folder
and do `fc-cache -f -v` to reload and install it
3. Install oh-my-zsh along with its plugins
remember to update your ~/.zshrc
  ```
  ZSH_THEME="powerlevel10k/powerlevel10k"

  update plugins: plugins=(
  git
  zsh-syntax-highlighting 
  ...
  )
  ```
4. copy all the folders into your ~/.config directory (excluding wallpapers, screenshots and fonts)
5. restart computer and login using i3 in your display manager
6. launch nitrogen in and add the ./wallpapers directory in order to choose preset wallpapers
7. use lxappearance to select icon and gtk theme (this can be skipped if you dont use gtk apps)
8. installation complete

> if you find the guide problematic or incomprehensive, feel free to raise an issue in the repository

## Dmenu Notes

- dmenu for commands
- j4-dmenu-desktop for apps
- dmenufm for file managing
- dmenu-pm for power managing
- networkmanager_dmenu for connecting to wifi

> if you dont want to you dmenu, you can also use rofi which is a modern replacement for it
> just use your package manager to instal the rofi package, the dotfiles are included in this repo as well

### setup
1. clone dmenu and add the config.h in this repo to build it
2. copy dmenu-pm, networkmanager_dmenu into /bin, (edit the commands used as needed)  
3. install j4-dmenu-desktop, dmenufm from github
4. copy dmenufm config dir in ./dmenu/dmenufm to .config

> this whole section is optional if you use rofi
> replace the dmenu section using this piece of code
```
# rofi configs
bindsym $mod+space exec "rofi -show drun -show-icons"
bindsym $mod+Shift+space exec "rofi -show run"
bindsym $mod+ctrl+space exec "rofi -show filebrowser -show-icons"
bindsym Shift+ctrl+BackSpace exec "rofi -show p -modi p:~/.config/rofi/rofi-pm"
```
the power menu requires configuration aswell, refer to <a>https://github.com/jluttine/rofi-power-menu</a>

## Language Inputs
- ibus libpinyin

put this code block into .profile to use ibus inputs
``` sh
export GTK_IM_MODULE=ibus
export QT4_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
```

## Special Notes (use only when gvfs is not working)

After installing i3 in most distros, there will be an error where dbus is not launched, therefor file managers have no access to gvfs (volumes and trashcan)

# Solution
at the end of `/etc/lightdm/Xsession`
```
exec dbus-launch @$
```

paste the code block above in `~/.xinitrc` or in `/etc/lightdm/Xsession` and reboot
