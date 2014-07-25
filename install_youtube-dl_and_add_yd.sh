#!/bin/bash
# add-yd.sh
# adds my yd scripts for youtube-dl and installs youtube-dl

sudo pacman -Sy --noconfirm youtube-dl rtmpdump python

USER_AGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36"

cat <<EOF | sudo tee /usr/local/bin/yd
#!/bin/bash
# yd
# Simplifies the use of youtube-dl (works with all site not just youtube)
# yd <link> <link> ...

youtube-dl --continue --max-quality=22 --ignore-errors --user-agent "$USER_AGENT" --output "%(title)s (%(id)s).%(ext)s" "\$@"
EOF

cat <<EOF | sudo tee /usr/local/bin/yda
#!/bin/bash
# yd
# Simplifies the use of youtube-dl (works with all site not just youtube)
# yd <link> <link> ...

youtube-dl --continue --max-quality=140 --ignore-errors --user-agent "$USER_AGENT" --output "%(title)s (%(id)s).%(ext)s" "\$@"
EOF


cat <<EOF | sudo tee /usr/local/bin/ydu
#!/bin/bash
# ydu
# Downloads all videos of a user
# ydu <username>

youtube-dl --continue --max-quality=22 --ignore-errors --user-agent "$USER_AGENT" --output "%(upload_date)s %(title)s (%(id)s).%(ext)s" "http://www.youtube.com/user/\$1"
EOF


cat <<EOF | sudo tee /usr/local/bin/ydp
#!/bin/bash
# ydp
# Downloads all videos of a playlist(s)
# ydp <link> <link> ...

youtube-dl --continue --max-quality=22 --ignore-errors --user-agent "$USER_AGENT" --output "%(autonumber)s %(title)s (%(id)s).%(ext)s" "\$@"
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
youtube-dl --continue --max-quality=22 --ignore-errors --user-agent "$USER_AGENT" --output "%(title)s (%(id)s).%(ext)s" "ytsearch\$count:\$@"
EOF


cat <<"EOF" | sudo tee /usr/local/bin/dl
#!/usr/bin/env python3
# dl - Downloader

import sys
import time
import urllib

def reporthook(count, block_size, total_size):
    global start_time
    if count == 0:
        start_time = time.time()
        return
    duration = time.time() - start_time
    progress_size = int(count * block_size)
    speed = int(progress_size / (1024 * duration))
    percent = int(count * block_size * 100 / total_size)
    sys.stdout.write("\r...%d%%, %d MB, %d KB/s, %d seconds passed" %
                    (percent, progress_size / (1024 * 1024), speed, duration))
    sys.stdout.flush()
 
def save(url, filename):
    urllib.urlretrieve(url, filename, reporthook)

for each in sys.argv[1:]:

    url = each
    filename = urllib.parse.unquote(url.rsplit('/',1)[1])

    print(filename)
    save(url, filename)
    print('\n')
EOF

sudo chmod +x /usr/local/bin/yd /usr/local/bin/yda /usr/local/bin/yds /usr/local/bin/ydp /usr/local/bin/ydu /usr/local/bin/dl
