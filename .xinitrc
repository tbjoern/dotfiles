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

redshift &

setxkbmap -option "grp:rctrl_toggle"

if [ -f $HOME/.screens ] ; then
    source $HOME/.screens
fi

while xsetroot -name "$KBMAP $WIFI $DATETIME"
do
    DATETIME=$(date "+%d.%m.%y %H:%M")
    WIFI=$(nmcli --fields name,state con show --active | awk 'NR>1 &&/activated/ { print $1 }')
    KBMAP=$(xkblayout-state print %s || echo "xkblayout-state not installed")
    sleep 1
done &

feh --bg-scale ~/Pictures/wallpaper.png

exec dwm
