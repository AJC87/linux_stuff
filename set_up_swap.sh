#!/bin/bash
# Script to create and enable a new swap file

# TODO: check this works

# TODO: should maybe have a path
readonly SWAP_FILE_NAME='swapfile'

# For a partition instead of file use the partition name below
# Should be 1G
dd if=/dev/zero of="${SWAP_FILE_NAME}" bs=1024 count=1048576

mkswap "${SWAP_FILE_NAME}"

# TODO: maybe switch to root for next commands
sudo swapon "${SWAP_FILE_NAME}"

# If on Red Hat etc improve security by doing
# TODO: check for similar distros
if [[ -s /etc/redhat-release ]] && [[ grep 'Red Hat' /etc/redhat-release ]]; then
    echo 'On Red Hat...'
    sudo chown root:root "${SWAP_FILE_NAME}"
    # 600
    sudo chmod u+rw "${SWAP_FILE_NAME}"
fi

if grep -v "${SWAP_FILE_NAME}" /proc/swaps; then
    echo 'Swap file not enabled, exiting...'
    exit 1
fi

# To remove
# sudo swapoff "${SWAP_FILE_NAME}"
# sudo rm -f "${SWAP_FILE_NAME}"
# Disable all swap
# sudo /sbin/swapoff -a
# Enable all
# sudo /sbin/swapon -a
