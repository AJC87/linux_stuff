#!/bin/bash
# Commands etc for systemd

readonly SERVICE_NAME='example.service'

# If changing the unit file run
# sudo systemctl daemon-reload

sudo cp unit_files/example.service /etc/systemd/system

sudo systemctl start example.service
# TODO: maybe check this
sudo systemctl status example.service

# To stop
# sudo systemctl stop example.service

# To check output
# Check if distro is Ubuntu, maybe do case insensitive
# sudo tail -f LOG_FILE
if uname -v | grep 'Ubuntu'; then
    echo 'Check /var/log/syslog'
else
    echo 'Check /var/log/messages'
fi

# To persist through boots
sudo systemctl enable example.service

# To disable
# sudo systemctl disable example.service
