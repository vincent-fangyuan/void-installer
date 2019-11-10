#!/bin/bash

# A script to apply settings at https://github.com/joestandring/dotfiles and various other changes to a fresh Void Linux install
# Joe Standring <git@joestandring.com>
# GNU GPLv3

echo -e "\e[31mChecking permissions...\e[0m"
if [ "$EUID" -eq 0 ]; then
	echo "Please do not run this script as root (e.g. using sudo)"
	exit
fi

echo -e "\e[31mUpdating and installing packages...\e[0m"
sudo xbps-install -Su
sudo xbps-install -S git neovim neofetch curl wget xorg-minimal calcurse setxkbmap dunst NetworkManager NetworkManager-openvpn network-manager-applet pywal feh pkg-config fontconfig-devel libX11-devel libXft-devel ncurses st-terminfo fish-shell compton cmus cmus-flac cmus-pulseaudio pulseaudio alsa-plugins-pulseaudio mpv newsboat ranger 

echo -e "\e[31mCloning dotfiles...\e[0m"
git clone https://github.com/joestandring/dotfiles

echo -e "\e[31mMoving files...\e[0m"
cp dotfiles/.bashrc ~
cp dotfiles/.xinitrc ~
cp -r dotfiles/.config ~

echo -e "\e[31mConfiguring Network Manager...\e[0m"
sudo echo 'polkit.addRule(function(action, subject) {
  if (action.id.indexOf("org.freedesktop.NetworkManager.") == 0 && subject.isInGroup("network")) {
    return polkit.Result.YES;
  }
});' > /etc/polkit-1/rules.d/50-org.freedesktop.NetworkManager.rules
