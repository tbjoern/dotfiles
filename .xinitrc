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

if [ -f $HOME/.xinitrc-local ] ; then
    source $HOME/.xinitrc-local
fi

# start some nice programs

# if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 # for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  # [ -x "$f" ] && . "$f"
 # done
 # unset f
# fi

if which picom; then
    picom --no-fade-openclose &
fi

redshift &

setxkbmap -layout us -variant altgr-intl -option "grp:rctrl_toggle" -option caps:escape

while xsetroot -name "$KBMAP $WIFI $BATTERY$BATTERY_CHARGING $DATETIME"
do
    DATETIME=$(date "+%d.%m.%y %H:%M")
    #WIFI=$(nmcli --fields name,state con show --active | awk 'NR>1 &&/activated/ { print $1 }')
    WIFI=$(nmcli --fields name,state con show --active | awk -v d="|" 'NR>1 &&/activated/ { $(NF--); s=(NR==2?s:s d)$0}END{print s }')
    KBMAP=$(xkblayout-state print %s || echo "xkblayout-state not installed")
    if [ -n "$SHOW_BATTERY" ]; then
        BATTERY=$(acpi -b | awk -F, '{ gsub(/ /, "", $2); gsub(/%/, "", $2); print $2 }')
        if acpi -b | grep Charging; then
            BATTERY_CHARGING="+"
        else
            BATTERY_CHARGING=
        fi
    else
        BATTERY=
        BATTERY_CHARGING=
    fi
    sleep 1
done &

if [ -f ~/Pictures/wallpaper.jpg ]
then
    WALLPAPER=~/Pictures/wallpaper.jpg
else
    WALLPAPER=~/Pictures/wallpaper.png
fi

feh --bg-fill $WALLPAPER

exec dwm
