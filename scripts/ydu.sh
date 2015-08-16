#!/bin/bash
# ydu
# Downloads all videos of a user
# ydu <username>

youtube-dl --continue --format="bestvideo[height<=?720]+bestaudio/best" --audio-format vorbis --embed-subs --embed-thumbnail --add-metadata --merge-output-format mkv --ignore-errors --sub-lang en --write-sub --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36" --output "%(upload_date)s %(title)s (%(id)s).%(ext)s" "http://www.youtube.com/user/$1"
