#!/bin/bash
# yda
# Simplifies the use of youtube-dl to download audio from youtube
# yda "<link> <link> ..."

USER_AGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36"

url=$@

download_video () {
	youtube-dl --continue --format=bestaudio --ignore-errors --user-agent "$USER_AGENT" --output "%(title)s (%(id)s).%(ext)s" "$1"
}

if [[ "$url" =~ ( |\') ]]; then
  arr=($url)
  for each in "${arr[@]}"; do
    download_video $each
  done
else
  download_video $url
fi
