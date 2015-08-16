#!/bin/bash
# dl
# Simplifies the use of axel
# dl "<link> <link> ..."

url=$@

download_video () {
  aria2c --max-concurrent-downloads=10 --continue=true --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36" "$1"
}

if [[ "$url" =~ ( |\') ]]; then
  arr=($url)
  for each in "${arr[@]}"; do
    download_video $each
  done
else
  download_video $url
fi
