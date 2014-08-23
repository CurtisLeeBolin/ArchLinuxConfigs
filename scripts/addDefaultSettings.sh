#!/bin/bash

sudo pacman -S --noconfirm --needed bash bash-completion nano tmux

sudo cp ../configs/.bashrc /etc/bash.bashrc
sudo mv ../configs/.nanorc /etc/nanorc
sudo mv ../configs/.profile /etc/profile
sudo mv ../configs/.tmux.conf /etc/tmux.conf
sudo mv ../configs/.yaourtrc /etc/yaourtrc
rm -f $HOME/.bashrc $HOME/.nanorc $HOME/.profile $HOME/.tmux.conf $HOME/.yaourtrc
sudo rm -f /root/.bashrc /root/.nanorc /root/.profile /root/.tmux.conf /root/.yaourtrc
