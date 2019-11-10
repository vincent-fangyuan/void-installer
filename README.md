# void-installer
void-installer is a script that configures a Void Linux installation using my [dotfiles](https://github.com/joestandring/dotfiles).
The aim is to provide the user with a feature-rich installation of Void Linux, without the need to install and configure anything manually.
These changes won't be for everyone! Be sure to check the changes this script makes before running it on your Void Linux installation!
## Contents
- [Getting Started](#getting-started)
 - [When to run install.sh](#when-to-run-install.sh)
 - [Running install.sh](#running-install.sh)
 - [Using intall.sh](#using-install.sh)
- [What does it do?](#what-does-it-do?)
- [Finishing touches](#finishing-touches)
- [Notes](#notes)
## Getting Started
### When to run install.sh
You should run install.sh almost as soon as Void Linux finishes booting for the first time, however you must ensure that you have a working internet connection:
```
ping github.com
```
### Running install.sh
| WARNING: installer.sh does not care about your current configuration. Ensure you know what the script will change before using it. |
| --- |
Clone the repositiory:
```
git clone https://github.com/joestandring/void-installer
```
Change directory into the repository:
```
cd void-installer
```
Allow the script to be executed:
```
chmod +x installer.sh
```
Run the script:
```
./installer.sh
```
(You will be told off for trying to install as root)
### Using install.sh
You will first be prompted to install all of the packages included with void-installer:
```
Do you want to continue? [Y/n]
```
Press the 'Y' key or ENTER to being installing the packages. This may take a few minuites as there are a lot of packages to install so grab some snacks
When the script has finished running, it will show:
```
Finished!
Just startx to jump right in
```
Congratulations, you're all set to use your shiny pre-riced Void Linux installation!
## What does it do?
installer.sh makes a lot of changes to your system, so be sure to read this first so you know what will be done before installing.
* Packages will be installed:
 * git
 * neovim
 * neofetch
 * curl
 * wget
 * xorg-minimal
 * calcurse
 * setxkbmap
 * dunst
 * NetworkManager (+ NetworkManager-openvpn, network-manager-applet)
 * pywal
 * feh
 * pkg-config
 * fontconfig-devel
 * libXinerama-devel
 * libX11-devel
 * libXft-devel
 * ncurses
 * st-terminfo
 * fish-shell
 * compton
 * cmus (+ cmus-flac, cmus-pulseaudio, clyrics)
 * pulseaudio (+ alsa-plugins-pulseaudio, pamixer)
 * mpv
 * newsboat
 * ranger
 * transmission
 * socklog-void
 * font-hack-ttf
 * nerd-fonts-ttf
 * make
 * cparser
* My [dotfiles](https://github.com/joestandring/dotfiles) will be cloned to ~/.dot
* .xinitrc .bashrc and .config/ will be merged/replaced with those in the ~/.dot directory
* The polkit rules for NetworkManager will be updated to allow using it without root (/etc/polkit-1/rules.d/50-org.freedesktop.NetworkManager.rules)
* Services will be enabled/dosabled/started/stopped:
* dwm, st, and dwm will be built
* [countdown](https://github.com/joestandring/countdown) [void-wiki-cli](https://github.com/joestandring/void-wiki-cli) and [dwm-bar](https://github.com/joestandring/dwm-bar) will be installed and placed in the ~/bin directory
* vim-plug will be installed to enable plugins
* dwm-bar-installer will run, allowing you to select the modules you want in the statusbar
## Finishing touches
Once you have started X (```startx```) youll notice the background is pretty ugly. To change this, edit the line in .xinitrc:
```
wal -i /usr/share/void-artwork/void-logo.png
```
to point to wherever your wallpaper directory is.
## Notes
* Mod 4 (Windows key) is used instead of left alt in dwm
