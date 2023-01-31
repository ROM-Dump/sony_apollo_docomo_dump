#!/bin/bash

cat boot.img.* 2>/dev/null >> boot.img
rm -f boot.img.* 2>/dev/null
cat system/system/app/Chrome/Chrome.apk.* 2>/dev/null >> system/system/app/Chrome/Chrome.apk
rm -f system/system/app/Chrome/Chrome.apk.* 2>/dev/null
cat system/system/app/Photos/Photos.apk.* 2>/dev/null >> system/system/app/Photos/Photos.apk
rm -f system/system/app/Photos/Photos.apk.* 2>/dev/null
cat system/system/app/app-scan3d-release/app-scan3d-release.apk.* 2>/dev/null >> system/system/app/app-scan3d-release/app-scan3d-release.apk
rm -f system/system/app/app-scan3d-release/app-scan3d-release.apk.* 2>/dev/null
cat system/system/priv-app/GmsCore/GmsCore.apk.* 2>/dev/null >> system/system/priv-app/GmsCore/GmsCore.apk
rm -f system/system/priv-app/GmsCore/GmsCore.apk.* 2>/dev/null
cat system/system/priv-app/Velvet/Velvet.apk.* 2>/dev/null >> system/system/priv-app/Velvet/Velvet.apk
rm -f system/system/priv-app/Velvet/Velvet.apk.* 2>/dev/null
cat system/system/priv-app/textinput-chn-xxhdpi-release/textinput-chn-xxhdpi-release.apk.* 2>/dev/null >> system/system/priv-app/textinput-chn-xxhdpi-release/textinput-chn-xxhdpi-release.apk
rm -f system/system/priv-app/textinput-chn-xxhdpi-release/textinput-chn-xxhdpi-release.apk.* 2>/dev/null
cat .git/objects/pack/pack-fac01a6b152cc6500ceaca5ff031ec98b54d37fa.pack.* 2>/dev/null >> .git/objects/pack/pack-fac01a6b152cc6500ceaca5ff031ec98b54d37fa.pack
rm -f .git/objects/pack/pack-fac01a6b152cc6500ceaca5ff031ec98b54d37fa.pack.* 2>/dev/null
cat system_other/deletable_media/Movies/Jumanji_Trailer_Sub.mp4.* 2>/dev/null >> system_other/deletable_media/Movies/Jumanji_Trailer_Sub.mp4
rm -f system_other/deletable_media/Movies/Jumanji_Trailer_Sub.mp4.* 2>/dev/null
