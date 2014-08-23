#!/bin/bash
# tor_i2p_privoxy_midori.sh
# installs and sets up tor, i2p, privoxy, and midori

# check for yaourt
if  ! hash yaourt > /dev/null 2>&1; then
	echo "Please install yaourt first!"
	exit 1
fi

# install packages
yaourt -S --noconfirm --needed tor privoxy midori jdk
yaourt -S --noconfirm --needed i2p

# setup privoxy
sudo patch -r - --force --unified /etc/privoxy/config <<"EOF"
--- /etc/privoxy/config.orig    2013-12-16 07:17:14.594392333 -0600
+++ /etc/privoxy/config 2013-12-16 07:17:46.204563826 -0600
@@ -2072,3 +2072,13 @@
 #
 #
 #
+
+forward-socks5 /       127.0.0.1:9050  .
+forward                        127.*.*.*/              .
+forward                        10.*.*.*/               .
+forward                        192.168.*.*             .
+forward                        172.16.*.*              .
+forward                        localhost/              .
+forward                        .local                  .
+forward                        .lan                    .
+forward                        .i2p                    127.0.0.1:4444
EOF

# tor, i2p, and privoxy: start and set to start at boot
for service in tor privoxy; do
	sudo systemctl enable $service
	sudo systemctl start $service
done

# setup midori
mkdir $HOME/.config/midori
cat > $HOME/.config/midori/config <<"EOF"
[settings]
default-encoding=UTF-8
enable-developer-extras=true
enable-site-specific-quirks=true
enable-dns-prefetching=false
enable-javascript=true
default-charset=UTF-8
last-window-width=800
last-window-height=837
location-entry-search=https://duckduckgo.com/?q=%s
clear-private-data=145
clear-data=page-icons,formhistory,web-cookies,flash-cookies,html5-databases,web-cache,offline-appcache,
show-statusbar=false
toolbar-items=TabNew,Back,Forward,ReloadStop,Homepage,Location,BookmarkAdd,Bookmarks,
homepage=https://duckduckgo.com/
tabhome=about:dial
download-folder=/home/lee/Downloads
http-proxy=127.0.0.1
http-proxy-port=8118
load-on-startup=MIDORI_STARTUP_BLANK_PAGE
preferred-encoding=MIDORI_ENCODING_UNICODE
proxy-type=MIDORI_PROXY_HTTP
identify-as=MIDORI_IDENT_CUSTOM
user-agent=\s

[extensions]
libtoolbar-editor.so=true
EOF

# create bookmark database
# xz -9 --stdout $HOME/.config/midori/bookmarks.db | base64 -
base64 --decode - <<"EOF" | xz --decompress - > $HOME/.config/midori/bookmarks.db
/Td6WFoAAATm1rRGAgAhARwAAAAQz1jM4AP/ADNdACmURZ1gyBn4JmSIjib+MZX9xyHgC1xQm/eJ
cnKx67+DU9zSGPcD/m6n7L28OoRluH7rAAAAW642PI5CCV0AAU+ACAAAABn0CUmxxGf7AgAAAAAE
WVo=
EOF
# xz -9 --stdout $HOME/.config/midori/bookmarks.db-shm | base64 -
base64 --decode - <<"EOF" | xz --decompress - > $HOME/.config/midori/bookmarks.db-shm
/Td6WFoAAATm1rRGAgAhARwAAAAQz1jM4H//AMVdAAw4vXMMzYBucN72fqrPlaa8PxFkgiQIKLTF
j2GPqF8+ejCKdVZOJvp+62noQbB12CXeKJ8wn1iXhxMWM0kTS1Y3iSkoL/IOvEuZOBmkkRbtjZ27
1zu8WtMFD1Ph1olX5QJYw9KEHghpz4k8iixD3vop5r/SyguBWB6B0AvoNSc6l/QrKIOrzDQqmZXt
KJxHtMoaRNQLKcCTHxBpIh0ifWP0ZL0vSka+3YZ2wZZHkwXa0N2qEvB6to1uqZZdWHGBnqk6weAA
AAAAALiFhr3WnvWJAAHhAYCAAgBz+ncdscRn+wIAAAAABFla
EOF
# xz -9 --stdout $HOME/.config/midori/bookmarks.db-wal | base64 -
base64 --decode - <<"EOF" | xz --decompress - > $HOME/.config/midori/bookmarks.db-wal
/Td6WFoAAATm1rRGAgAhARwAAAAQz1jM4FH/BipdABufvMhfALyuvum0sdpm9la8230Sov0ExDg4
T+PpR7fjx6ALoCf0bAtpM9rxzoIaMFkejhpC+Kk0UgcWon8O5B1xb75+HcNdvaUO5p4AEBJLC6wF
6wd2BxXc+USykFzQitcK9COweEN0rTyHQxKIuVwy7louXl3eMr1Tl+Nh8pCKdwFjqG40Hji8tJ59
fXnXzCiqsqyYbUeSn43tStArU458oc8kf2nw5TA1WYl6M2I7ZUgwl32pXpKt0W/gJ5HDvfF6d4mi
JSoTrzP52K0neOJ2mW+9q8xMDgpoz1E5KFYTUn2mMHsSvsMrldKBnIZ6EuVQOERTk25+CKsf92id
zbZbFNPD2rTpqJJEnQd1WSc3fmMKyV16rNEIrnWKQSuE2wi+WHSUq2c9nVmDw6YLA/zL1R1U64Z9
l8q3I4RvQBB0AFTHnDITyg8W8Bbh2MsQDHadq2Lay6Wznj4apn3jM9SUb7fMx+i7y4DfG889nZSQ
mTWTJYhqcP8an0Jn5q3XmJHPLk22ExTV599F/nvGAIK7l58pXDIoYfLLxWv7aMJgM5oDNztCLKDc
lbjViQmrofVn1TON7mVa4DvYJxhGVNYtfgj26DNhYQd1NFwopn3PNO08HEjC1dUeQ9Dfoatn+JVF
X/P8itymI1cLEmFVM74K1/ohy/tHiJkXSurpHsT9ipLi5PNJJbSBCYSs/jhfebNxiY1dXR+rVsZR
AimQxssflvPWAgnhs37FSIseY8qiUuvFErD556Z+wMIu1k9LLfoT+iZQe/SujdezuV9Wuc011pPc
0tBXJOddlB/T3bLY+nCWLcD1Wdnevu3pnyZnreT1G2RhHqm2VbDU8lmJ2zx6KP/3ZocYGcgPDfAz
VxC6tM5y2CRJz1AhEch0eNNKC/K9NVLqRluQ8CGlGJ+2wvtob3H+uHdvBFT35fHgcxyiFcc3bu8i
oowcwUlsokyqFrWVodGh6ck1ZCD6TYGzZI69XVhL9tVLYMw6uGdVCbsUh9RzNAlU0o6mWBJKgOdd
3a4vnAkOQmKj29mGVk7gul0GwG8bcXo44s+TdKlwvsDnfUGgL2g4CjbfSPFi1Yx2Ws+qwuEMGpY0
43d2GnRrAhiBTAUY+m2BhXqb0Vr77WpjIDBdedLN0+Qn5lAgKPxauHMCsPMSQPILGbK7Oz4W/Y+u
WJKoog4PSHDuQ4r5iqjnvk0s6kLlfkNlmhRvAO8ptT5V+C1g9D2uFa+kvgOWMqgcnalyKaBPnBis
tDTuKAezDCdj1XMejGbEgOP4fwUwC1qDvxCbzmABCIE0B/EFpfsifIcChkbKGLRY328hA+OmRfC8
Hmip766zOy1BzAmAzmNnckc07V4kLuCQlk+eAUEls/7gSEKsJkZiIiRPR4E/FuP3n8LdyQxbB2V9
d7iWbQ64eFQhwX2wW/mCtj3AmxpxxHqqWRrAhRMgzU36tSMiH/E9mPGi2I4k/ZgtPFFzgHAHd/hI
icn3D1lQRo1k+uifKuJ9DJk+mhC/DQIZPqa8Sh2HHg4z+Xdho4ecyus5V6cOdaZImBYSZbTH77vu
ASUk6wnKJcSrJnxiQh3Y7/Cf30T/AeJjt/TcxCD2t+T4kLW+9wP11eyZ+xJFWkzurb94MHboHx/w
wAeEkdCs133UdDRwDtPvkSwas0J9/Qx6Jme2cSE/aQeIF4dcz2cAhH5Y1IL/PonvkPCVieoz8cgD
DVjxriI4XD2Kruyd9H5dDJzoGYshEdOIdlnGAaNgzT6ixgsGlSb9xZVjiQ542VOF1jtbkb79Pwfj
9C+YVkDBWHqAmLzm+TR2HWI1ZFW3OJ2CpozmhrMQhOSf2UmawJuyjODdBxu2tRWw7EIl0WDrp13T
H8ND40WdfDIzEAhLCiBy1NPZEVJIw9MyQgUYvteUczAX1OzV9eorLPmd4H7QUgv/SAPfpt3TSf8O
Di4taUEupqNUGM0K4o5t1xxw0ae8ebtjg0+8mSbVANS7mn9z7whRz5O2coe4mrq9B29Xv9hsuyUy
6vTDZixiOImQLSI6XsFx+BXLRX4D6QQ0KO8ZohmklA0Mc7z/pAIIrKPzmH1FOFZVWzoCyrrpzDc9
Qsz/agbuu9wQGAJTAAAAAEde5cI7H3C0AAHGDICkAQCztifrscRn+wIAAAAABFla
EOF
