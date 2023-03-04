#!/bin/bash
# Script to configure a hostname

# TODO: check this works

# TODO: put in the hostname you want
readonly HOSTNAME=''
# Maybe an easier way like hostname -i
# TODO: need to capture the bit after inet without the /
# readonly ADDRESS="$(ip addr show "${NETWORK_INTERFACE}")"

# How many spaces do we need?
sudo sh -c "echo '${ADDRESS} ${HOSTNAME}' >> /etc/hosts"

if ! ping -c 1 "${HOSTNAME}"; then
    echo "Can't ping the host with new hostname: ${HOSTNAME}, exiting..."
    exit 1
fi
