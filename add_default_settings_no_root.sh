#!/bin/bash

configs=(
  '.bashrc'
  '.bash_profile'
  '.nanorc'
  '.tmux.conf'
)

for config in "${configs[@]}"; do
  cp -v configs/${config} ~/
done

nano_syntax_highlights=(
  $(find /usr/share/nano/ -type f -name *.nanorc)
)

for nano_syntax_highlight in "${nano_syntax_highlights[@]}"; do
  echo "${nano_syntax_highlight}"
  echo "include ${nano_syntax_highlight}" >> ~/.nanorc
done
