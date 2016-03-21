#!/bin/bash
# install_yaourt.sh

sudo pacman -S --noconfirm --needed base-devel git
mkdir -p /tmp/build/
cd /tmp/build
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd package-query
makepkg -si --noconfirm
cd ../yaourt
makepkg -si --noconfirm
cd ../../
rm -rf build
cd
yaourt -D --asexplicit package-query yaourt
