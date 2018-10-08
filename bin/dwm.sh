#!/bin/sh

# Configure Chris' monitors within DWM

set -x

# Enable all monitors that are actually connected
xrandr --auto

layoutname="$HOME/.screenlayout/$(get-layout)"
if [ -e "$layoutname" ]; then
    source "$layoutname"
fi

if [ -e "$HOME/.config/tweak-dwm-setup" ]; then
    source "$HOME/.config/tweak-dwm-setup"
fi

feh --bg-scale --random "$HOME/Pictures/Wallpaper/"

for daemon in slstatus compton sxhkd redshift ; do
    if ! pgrep "$daemon" > /dev/null 2>&1; then
    	$daemon > "/tmp/$daemon.log" 2>&1 &
    fi
done

