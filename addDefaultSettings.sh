#!/bin/bash

for each in .bashrc .nanorc .profile .screenrc .yaourtrc; do
	curl -O https://raw.githubusercontent.com/CurtisLeeBolin/MyArchLinuxGoodies/master/"$each"
done

sudo mv .bashrc /etc/bash.bashrc
sudo mv .nanorc /etc/nanorc
sudo mv .profile /etc/profile
sudo mv .screenrc /etc/screenrc
sudo mv .yaourtrc /etc/yaourtrc
rm -f $HOME/.bashrc $HOME/.nanorc $HOME/.profile $HOME/.screenrc $HOME/.yaourtrc
sudo rm -f /root/.bashrc /root/.nanorc /root/.profile /root/.screenrc /root/.yaourtrc
