# Special Notes

After installing i3 in most distros, there will be an error where dbus is not launched, therefor file managers have no access to gvfs (volumes and trashcan)


# Solution
```
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
    exec dbus-launch --exit-with-session --sh-syntax i3
  done
  unset f
fi
```

paste the code block above in `~/.xinitrc` or in `/etc/lightdm/Xsession` and reboot
