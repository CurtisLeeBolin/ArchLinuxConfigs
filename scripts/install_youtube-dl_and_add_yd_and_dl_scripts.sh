#!/bin/bash
# add-yd.sh
# adds my dl and yd scripts for youtube-dl and installs youtube-dl

sudo pacman -Sy --noconfirm --needed curl python-pip atomicparsley ffmpeg python-pycryptodome rtmpdump

pip install youtube-dl

script_arr=(dl yd yda ydd ydn ydupdate)
for each in "${script_arr[@]}"; do
  cp ./"$each".sh  ~/.local/bin/"$each"
  chmod a+rx ~/.local/bin/"$each"
done
