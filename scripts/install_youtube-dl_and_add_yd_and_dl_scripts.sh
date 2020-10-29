#!/bin/bash
# add-yd.sh
# adds my dl and yd scripts for youtube-dl and installs youtube-dl

sudo pacman -Sy --noconfirm --needed curl atomicparsley ffmpeg python-pycryptodome rtmpdump

curl -L https://yt-dl.org/downloads/latest/youtube-dl -o ~/.local/bin/youtube-dl
chmod a+rx ~/.local/bin/youtube-dl

script_arr=(dl yd ydn yda ydd ydp yds ydu ydupdate)
for each in "${script_arr[@]}"; do
  cp ./"$each".sh  ~/.local/bin/"$each"
  chmod a+rx ~/.local/bin/"$each"
done
