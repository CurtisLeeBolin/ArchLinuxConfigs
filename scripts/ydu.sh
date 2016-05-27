#!/bin/bash
# ydu
# Downloads all videos of a user
# ydu <username>

youtube-dl --continue --embed-subs --embed-thumbnail --add-metadata \
  --merge-output-format mkv --ignore-errors --sub-lang en --write-sub \
  --output "%(upload_date)s %(title)s (%(id)s).%(ext)s" \
  "http://www.youtube.com/user/$1"
