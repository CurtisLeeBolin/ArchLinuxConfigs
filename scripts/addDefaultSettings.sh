#!/bin/bash

# check for yaourt
if  ! hash yaourt > /dev/null 2>&1; then
	echo "Please install yaourt first!"
	exit 1
fi

sudo pacman -S --noconfirm --needed bash bash-completion nano tmux

sudo cp ../configs/.bashrc /etc/bash.bashrc
sudo cp ../configs/.nanorc /etc/nanorc
sudo cp ../configs/.profile /etc/profile
sudo cp ../configs/.tmux.conf /etc/tmux.conf
sudo cp ../configs/.yaourtrc /etc/yaourtrc
rm -f $HOME/.bashrc $HOME/.nanorc $HOME/.profile $HOME/.tmux.conf $HOME/.yaourtrc
sudo rm -f /root/.bashrc /root/.nanorc /root/.profile /root/.tmux.conf /root/.yaourtrc
sudo rm /etc/skel/{.bash_logout,.bash_profile,.bashrc}
