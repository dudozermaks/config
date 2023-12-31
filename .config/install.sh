#!/usr/bin/env bash

# installing paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

# updating packages
paru

# installing everything
# grep . removes blanklines. paru likes them very much. he wants to install them, but can not find any package named "" :(. very sad...
~/.config/get_packages.sh | grep . | paru -S --needed -
