#!/bin/bash
# installExtraFonts.sh

sudo pacman -S --noconfirm --needed $(pacman -Ssq ttf-) $(pacman -Ssq otf-)
