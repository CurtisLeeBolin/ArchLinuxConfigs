#!/bin/bash

sudo pacman -S --noconfirm --needed bash bash-completion nano tmux rsync openssh

sudo cp ../configs/.bashrc /etc/bash.bashrc
sudo cp ../configs/.nanorc /etc/nanorc
sudo cp ../configs/.tmux.conf /etc/tmux.conf
