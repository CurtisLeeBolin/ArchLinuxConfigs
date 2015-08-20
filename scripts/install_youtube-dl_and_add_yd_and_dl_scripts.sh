#!/bin/bash
# add-yd.sh
# adds my dl and yd scripts for youtube-dl and installs youtube-dl

sudo pacman -Sy --noconfirm --needed youtube-dl rtmpdump python ffmpeg aria2

script_arr=(dl yd yda ydc ydp yds ydu)
for each in "${script_arr[@]}"; do
  sudo cp ./"$each".sh  /usr/local/bin/"$each"
  sudo chmod +x /usr/local/bin/"$each"
done
