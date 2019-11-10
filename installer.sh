#!/bin/bash

# A script to apply settings at https://github.com/joestandring/dotfiles and various other changes to a fresh Void Linux install
# Joe Standring <git@joestandring.com>
# GNU GPLv3

echo "Checking permissions..."
if [ "$EUID" -ne 0 ]; then
	echo "Please run this script as root (e.g. sudo ./installer.sh)"
	exit
fi

echo "Updating..."
xbps-install -Su

echo "Cloning dotfiles..."
xbps-install -S git
git clone https://github.com/joestandring/dotfiles .dot
