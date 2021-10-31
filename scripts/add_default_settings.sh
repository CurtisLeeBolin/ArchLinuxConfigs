#!/bin/bash

sudo pacman -S --noconfirm --needed bash bash-completion nano tmux

cp ../configs/{.bashrc,.bash_profile,.nanorc,.tmux.conf} ~/
