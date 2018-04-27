#!/bin/bash

sudo pacman -S --noconfirm --needed bash bash-completion nano tmux rsync openssh

sudo cp ../configs/.bashrc /etc/bash.bashrc
sudo cp ../configs/.nanorc /etc/nanorc
sudo cp ../configs/.profile /etc/profile
sudo cp ../configs/.tmux.conf /etc/tmux.conf
rm -f $HOME/.bashrc $HOME/.nanorc $HOME/.profile $HOME/.tmux.conf
sudo rm -f /root/.bashrc /root/.nanorc /root/.profile /root/.tmux.conf
sudo rm /etc/skel/{.bash_logout,.bash_profile,.bashrc}
