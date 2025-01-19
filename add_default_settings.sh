#!/bin/bash

sudo pacman -S --noconfirm --needed bash bash-completion nano tmux curl lesspipe bat

configs=(
  '.bashrc'
  '.bash_profile'
  '.nanorc'
  '.tmux.conf'
)

for config in "${configs[@]}"; do
  cp -v configs/${config} ~/
  sudo cp -v configs/${config} /root/
done

nano_syntax_highlights=(
  $(find /usr/share/nano/ -type f -name *.nanorc)
)

for nano_syntax_highlight in "${nano_syntax_highlights[@]}"; do
  echo "${nano_syntax_highlight}"
  echo "include ${nano_syntax_highlight}" >> ~/.nanorc
  sudo bash -c "echo include ${nano_syntax_highlight} >> /root/.nanorc"
done

sudo cp -v configs/modules-load.d/* /etc/modules-load.d/

sudo cp -v configs/sudoers.d/* /etc/sudoers.d/
