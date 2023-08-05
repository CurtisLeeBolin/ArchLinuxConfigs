#!/bin/bash

sudo pacman -S --noconfirm --needed bash bash-completion nano tmux

cp configs/{.bashrc,.bash_profile,.nanorc,.tmux.conf} ~/
sudo cp configs/{.bashrc,.bash_profile,.nanorc,.tmux.conf} /root/

find /usr/share/nano/ -type f -name *.nanorc -exec echo "include {}" >> ~/.nanorc \;
sudo bash -c 'find /usr/share/nano/ -type f -name *.nanorc -exec echo "include {}" >> /root/.nanorc \;'

sudo cp configs/modprobe.d/* /etc/modprobe.d/

sudo cp configs/sudoers.d/* /etc/sudoers.d/
