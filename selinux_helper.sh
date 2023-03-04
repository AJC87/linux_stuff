#!/bin/bash
# Script to help with SELinux

# TODO: check this works

# Need to be on a Red Hat like system, build this out - works for Red Hat itself
if [[ ! -s /etc/redhat-release ]] && [[ grep -v 'Red Hat' /etc/redhat-release ]]; then
    echo 'Need to be on a Red Hat like system, exiting...'
    exit 1
fi

# Check enabled and in enforce mode
sestatus
getenforce

# Check a file
# ls -Z FILENAME

# Change context, do we need sudo?
# chcon -t CONTEXT FILENAME
