#!/bin/bash

sudo pacman -S --noconfirm --needed bash bash-completion nano tmux

cp ../configs/{.bashrc,.nanorc,.tmux.conf} ~/
