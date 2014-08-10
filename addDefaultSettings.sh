#!/bin/bash

sudo pacman -S --noconfirm --needed bash bash-completion

for each in .bashrc .nanorc .profile .tmux.conf .yaourtrc; do
	curl -O https://raw.githubusercontent.com/CurtisLeeBolin/MyArchLinuxGoodies/master/"$each"
done

sudo mv .bashrc /etc/bash.bashrc
sudo mv .nanorc /etc/nanorc
sudo mv .profile /etc/profile
sudo mv .tmux.conf /etc/tmux.conf
sudo mv .yaourtrc /etc/yaourtrc
rm -f $HOME/.bashrc $HOME/.nanorc $HOME/.profile $HOME/.tmux.conf $HOME/.yaourtrc
sudo rm -f /root/.bashrc /root/.nanorc /root/.profile /root/.tmux.conf /root/.yaourtrc
