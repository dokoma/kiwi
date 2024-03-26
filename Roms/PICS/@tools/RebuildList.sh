#!/bin/sh
progdir=`dirname "$0"`
#cd $progdir
#HOME=$progdir

#remove all  , no will trash the @tools
#rm -f /mnt/SDCARD/Roms/PICS/*
cd /mnt/SDCARD/Roms/PICS
find . -type f -name "*.phf" -exec rm -f {} \;

#will keep @tools with content
#find  -type d -delete
find  -type d -exec rmdir {} \;
rm -f *cache*.db

export picdir="/mnt/SDCARD/Data/PICTURE"
cd $picdir
export phfdir="/mnt/SDCARD/Roms/PICS"

#xcopy /t /e ../PICS
echo find -type d -regex -print0 -exec mkdir ${phfdir}/{} \;
find -type d -print0 -exec mkdir ${phfdir}/{} \;

#then fake the files

find -type f -regex '.*\.\(jpg\|png\)' -print0 -exec sh -c  'touch "${phfdir}${1%.*}.ph@${1##*.}" ' sh {} \;

