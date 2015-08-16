#!/bin/bash
# yds
# Downloads from a youtube search
# yds <number> <search terms>
#
# examples to download 10 Harlem Shake Videos:
#
# yds 10 Harlem\ Shake
# or 
# yds 10 "Harlem Shake"

USER_AGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36"

count="$1"
shift
youtube-dl --continue --format="bestvideo[height<=?720]+bestaudio/best" --audio-format vorbis --embed-subs --embed-thumbnail --add-metadata --merge-output-format mkv --ignore-errors --sub-lang en --write-sub --user-agent "$USER_AGENT" --output "%(title)s (%(id)s).%(ext)s" "ytsearch$count:$@"
