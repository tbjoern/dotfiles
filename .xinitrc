#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

# if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 # for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  # [ -x "$f" ] && . "$f"
 # done
 # unset f
# fi

if [ -f $HOME/.screens ] ; then
    source $HOME/.screens
fi

while xsetroot -name "$WIFI $BATTERY⚡ $DATETIME"
do
    DATETIME=$(date "+%d.%m.%y %H:%M")
    WIFI=$(nmcli --fields name,state con show --active | awk 'NR>1 &&/activated/ { print $1 }')
    BATTERY=$(acpi -b | awk -F, '{ gsub(/ /, "", $2); gsub(/%/, "", $2); print $2 }')
    sleep 1
done &

feh --bg-scale ~/Pictures/wallpaper.jpg

exec dwm
