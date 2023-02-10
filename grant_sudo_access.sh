#!/bin/bash
# Script to give my user sudo access

# TODO: see if this works

# TODO: if running in a script might need to do su first

# TODO: maybe allow passing in user

readonly USER=$(whoami)

cat << EOSU > "/etc/sudoers.d/${USER}"
"${USER}" ALL=(ALL) ALL
EOSU

# TODO: maybe 400, may need su
chmod 440 "/etc/sudoers.d/${USER}"
