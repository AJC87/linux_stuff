#!/bin/bash
# Script to install Node.js using nvm

# TODO: check shell, parametrise version

if ! command -v nvm &> /dev/null; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
fi

nvm install 18
