#!/bin/bash

sudo pacman -Sy --noconfirm --needed base-devel git
mkdir -p /tmp/build/
cd /tmp/build/
git clone https://aur.archlinux.org/pikaur.git
cd pikaur/
makepkg -si --noconfirm
cd
rm -rf /tmp/build
pikaur -D --asexplicit pikaur
