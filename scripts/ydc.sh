#!/bin/bash
# ydc
# Downloads all videos of a /c/ channel
# ydc <channel>

cookie=$(<~/.config/youtube-dl/cookies.txt)

youtube-dl --continue --embed-subs --embed-thumbnail --add-metadata \
  --merge-output-format mkv --ignore-errors --sub-lang en --write-sub \
  --cookies ~/.config/youtube-dl/cookies.txt \
  --output "%(upload_date)s %(title)s (%(id)s).%(ext)s" \
  "http://www.youtube.com/c/$1"
