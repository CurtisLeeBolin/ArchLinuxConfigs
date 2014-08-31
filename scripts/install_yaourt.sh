#!/bin/bash
# install_yaourt.sh

sudo pacman -S --noconfirm --needed base-devel
mkdir -p /tmp/build/package-query
mkdir -p /tmp/build/yaourt
cd /tmp/build/package-query
curl -O https://aur.archlinux.org/packages/pa/package-query/PKGBUILD
makepkg -si --noconfirm
cd /tmp/build/yaourt
curl -O https://aur.archlinux.org/packages/ya/yaourt/PKGBUILD
makepkg -si --noconfirm
cd ../../
rm -rf build
cd
yaourt -D --asexplicit package-query yaourt
