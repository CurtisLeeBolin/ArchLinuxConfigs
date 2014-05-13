#!/bin/bash
# installExtraFonts.sh

sudo pacman -S $(pacman -Ssq ttf-)
