#!/bin/bash
# install_aurman.sh

sudo pacman -S --noconfirm --needed base-devel git expac pyalpm python-regex 
mkdir -p /tmp/build/
cd /tmp/build/
git clone https://aur.archlinux.org/aurman.git
cd aurman/
makepkg -si --noconfirm
cd
rm -rf /tmp/build
aurman -D --asexplicit aurman
