#!/bin/bash
# ydp
# Downloads all videos of a playlist(s)
# ydp <link> <link> ...

youtube-dl --continue --format="bestvideo[height<=?720]+bestaudio/best" --audio-format vorbis --embed-subs --embed-thumbnail --add-metadata --merge-output-format mkv --ignore-errors --sub-lang en --write-sub --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36" --output "%(autonumber)s %(title)s (%(id)s).%(ext)s" "$@"
