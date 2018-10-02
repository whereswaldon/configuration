#!/bin/sh

# Configure Chris' monitors within DWM

set -x

# Enable all monitors that are actually connected
xrandr --auto

if [ -e "$HOME/.config/tweak-dwm-setup" ]; then
    source "$HOME/.config/tweak-dwm-setup"
fi

# laptop="eDP"
# mon1="DisplayPort-2"
# mon2="DisplayPort-0"
# if xrandr 2>&1 | grep eDP-1 > /dev/null 2>&1 ; then
#     laptop="eDP-1"
#     mon1="DP-3"
#     mon2="DP-1"
# fi

# xrandr --output "$laptop" --mode 1920x1200
# xrandr --output "$mon1" --above "$laptop"
# xrandr --output "$mon2" --left-of "$mon1"

feh --bg-scale --random /home/chriswaldon/Pictures/Wallpaper/

for daemon in slstatus compton sxhkd redshift ; do
    if ! pgrep "$daemon" > /dev/null 2>&1; then
    	$daemon > "/tmp/$daemon.log" 2>&1 &
    fi
done

# targetspeed=4000
# for fan in $(seq 1 2); do
#     if [ $(cat /sys/devices/platform/applesmc.768/fan${fan}_min) -lt "$targetspeed" ]; then
#     	echo "$targetspeed" > /sys/devices/platform/applesmc.768/fan${fan}_min
#     fi
# done

