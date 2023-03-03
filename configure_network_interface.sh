#!/bin/bash
# Script to configure a network interface to use static address instead of DHCP

# TODO: for GCP for now but can adapt it, also for Debian based but can adapt it
# the interfaces start at ens4 on GCP VMs, may be eth0 onwards elsewhere

readonly NETWORK_INTERFACE='ens4'

# Maybe an easier way like hostname -i
# TODO: need to capture the bit after inet without the /
# readonly ADDRESS="$(ip addr show "${NETWORK_INTERFACE}")"
# readonly NETMASK="$()"
readonly GATEWAY="$(ip route | grep 'default' | cut -d ' ' -f 1)"

# Backup in case
sudo cp /etc/resolv.conf /etc/resolv.conf.bak

# sudo ip link set "${NETWORK_INTERFACE}" down

# For Red Hat based use /etc/sysconfig/network-scripts/ifcfg-NETWORK_INTERFACE
# DEVICE="${NETWORK_INTERFACE}"
# BOOTPROTO=static
# ONBOOT=yes
# IPADDR="${ADDRESS}"
# NETMASK="${NETMASK}"
# GATEWAY= "${GATEWAY}"

# TODO: edit /etc/networking/interfaces
# iface "${NETWORK_INTERFACE}" inet static
# "${ADDRESS}"
# "${NETMASK}"
# "${GATEWAY}"

# sudo ip link set "${NETWORK_INTERFACE}" up

sudo cp /etc/resolv.conf.bak /etc/resolv.conf

# Check /etc/networking/interfaces and /etc/hosts

if ! ping -c 1 "$(hostname)"; then
    echo "Can't ping the host, exiting..."
    exit 1
fi
