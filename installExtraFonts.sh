#!/bin/bash
# installExtraFonts.sh

if  ! hash yaourt > /dev/null 2>&1; then
	echo "Please install yaourt first!"
else
	yaourt -S --noconfirm ttf-baekmuk ttf-unfonts-core ttf-nanum ttf-nanumgothic_coding otf-ipafont ttf-vlgothic ttf-mplus ttf-ipa-mona ttf-monapo ttf-sazanami ttf-tw wqy-microhei wqy-zenhei ttf-arphic-ukai ttf-arphic-uming opendesktop-fonts ttf-hannom ttf-qurancomplex-fonts ttf-amiri ttf-sil-lateef ttf-sil-scheherazade ttf-arabeyes-fonts ttf-pingwi-typography otf-gfs ttf-mgopen culmus ttf-freebanglafont ttf-indic-otf lohit-fonts font-mathematica ttf-mathtype ttf-bitstream-vera ttf-vista-fonts ttf-dejavu ttf-freefont ttf-ms-fonts ttf-liberation
fi
