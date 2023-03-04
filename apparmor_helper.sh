#!/bin/bash
# Script to help with AppArmor

# Need to be on Ubuntu say
if uname -v | grep -v 'Ubuntu'; then
    echo 'Not on Ubuntu, exiting...'
    exit 1
fi

sudo apt-get update
sudo apt-get install -y apparm*

# sudo aa-status | grep PATH_TO_PROGRAM

# sudo aa-genprof from a different terminal tab/window to the one running the program in question

# To check profile
# cat /etc/apparmor.d/PROFILE_NAME 

# Once scanning is done
# sudo aa-genproc
# sudo systemctl reload apparmor
