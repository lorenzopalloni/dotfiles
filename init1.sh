#!/bin/sh

set -o errexit  # terminate the script on command fails
set -o nounset  # terminate the script on variable unset

# Update the system
sudo apt update

# Install some useful packages
sudo apt install -y vim zsh tmux git \
    python3.8 python3.8-venv python-pip \
    xclip xsel

# Generate an ssh key
ssh-keygen -t rsa -b 4096

# Copy the public key
xclip -sel clipboard -i ~/.ssh/id_rsa.pub

