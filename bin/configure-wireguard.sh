#!/bin/sh

set +x
interface="wg0"
subnet="192.168.17.5/24"
configfile="/home/chris/.config/wireguard/$interface.conf"

# if the interface is missing, make it
if ! ip link show "$interface" > /dev/null 2>&1 ; then
    sudo ip link add dev "$interface" type wireguard || exit 1
else
    echo "Interface $interface already exists, not creating it"
fi

# if the interface lacks the IP address/subnet, add it
if ! ip addr show "$interface" 2>&1 | grep "$subnet" > /dev/null 2>&1 ; then
    sudo ip addr add dev "$interface" "$subnet" || exit 2
else
    echo "Interface $interface already has subnet $subnet, not adding it"
fi

# reapply the configuration, should be a no-op
if [ -e "$configfile" ] ; then
    echo "Configuring with $configfile, this may take 30 seconds or so..."
    sudo wg setconf "$interface" "$configfile" || exit 4
else
    echo "Fatal: No configuration file found at $configfile"
    exit 8
fi

# if the interface is down, set it up
if ip link show "$interface" 2>&1 | grep "state DOWN" > /dev/null 2>&1 ; then
    sudo ip link set up "$interface" || exit 16
else
    echo "Interface $interface is already up, not bringing it up"
fi
