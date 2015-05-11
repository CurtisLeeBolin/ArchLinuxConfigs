#!/bin/bash
# add-yd.sh
# adds my dl and yd scripts for youtube-dl and installs youtube-dl

sudo pacman -Sy --noconfirm --needed youtube-dl rtmpdump python ffmpeg aria2

USER_AGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36"


cat <<EOF | sudo tee /usr/local/bin/yd
#!/bin/bash
# yd
# Simplifies the use of youtube-dl (works with all site not just youtube)
# yd <link> <link> ...

youtube-dl --continue --format="best[height <=? 720]" --recode-video mkv --audio-format vorbis --embed-subs --embed-thumbnail --add-metadata --ignore-errors --sub-lang en --write-sub --user-agent "$USER_AGENT" --output "%(title)s (%(id)s).%(ext)s" "\$@"
EOF


cat <<EOF | sudo tee /usr/local/bin/yda
#!/bin/bash
# yda
# Simplifies the use of youtube-dl to download audio from youtube
# yda <link> <link> ...

youtube-dl --continue --format=bestaudio --ignore-errors --user-agent "$USER_AGENT" --output "%(title)s (%(id)s).%(ext)s" "\$@"
EOF


cat <<EOF | sudo tee /usr/local/bin/ydu
#!/bin/bash
# ydu
# Downloads all videos of a user
# ydu <username>

youtube-dl --continue --format="best[height <=? 720]" --recode-video mkv --audio-format vorbis --embed-subs --embed-thumbnail --add-metadata --ignore-errors --sub-lang en --write-sub --user-agent "$USER_AGENT" --output "%(upload_date)s %(title)s (%(id)s).%(ext)s" "http://www.youtube.com/user/\$1"
EOF


cat <<EOF | sudo tee /usr/local/bin/ydp
#!/bin/bash
# ydp
# Downloads all videos of a playlist(s)
# ydp <link> <link> ...

youtube-dl --continue --format="best[height <=? 720]" --recode-video mkv --audio-format vorbis --embed-subs --embed-thumbnail --add-metadata --ignore-errors --sub-lang en --write-sub --user-agent "$USER_AGENT" --output "%(autonumber)s %(title)s (%(id)s).%(ext)s" "\$@"
EOF


cat <<EOF | sudo tee /usr/local/bin/yds
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

count="\$1"
shift
youtube-dl --continue --format="best[height <=? 720]" --recode-video mkv --audio-format vorbis --embed-subs --embed-thumbnail --add-metadata --ignore-errors --sub-lang en --write-sub --user-agent "$USER_AGENT" --output "%(title)s (%(id)s).%(ext)s" "ytsearch\$count:\$@"
EOF


cat <<EOF | sudo tee /usr/local/bin/dl
#!/bin/bash
# dl
# Simplifies the use of axel
# dl <link> <link> ...

for url in \$@; do
  aria2c --max-concurrent-downloads=10 --continue=true --user-agent="$USER_AGENT" "\$url"
done
EOF


sudo chmod +x /usr/local/bin/yd /usr/local/bin/yda /usr/local/bin/yds /usr/local/bin/ydp /usr/local/bin/ydu /usr/local/bin/dl
