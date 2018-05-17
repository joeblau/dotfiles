#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Copy filtered hosts file to /etc/hosts
curl -L -s https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts > /etc/hosts
