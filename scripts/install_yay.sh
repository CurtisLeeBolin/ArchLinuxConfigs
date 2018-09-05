#!/bin/bash
# install_yay.sh

sudo pacman -S --noconfirm --needed base-devel git sudo go go-pie
mkdir -p /tmp/build/
cd /tmp/build/
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm
cd
rm -rf /tmp/build
yay -D --asexplicit yay
