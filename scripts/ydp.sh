#!/bin/bash
# ydp
# Downloads all videos of a playlist(s)
# ydp <link> <link> ...

youtube-dl --continue --embed-subs --embed-thumbnail --add-metadata \
  --merge-output-format mkv --ignore-errors --sub-lang en --write-sub \
  --output "%(autonumber)s %(title)s (%(id)s).%(ext)s" "$@"
