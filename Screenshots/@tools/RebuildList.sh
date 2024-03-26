#!/bin/sh
progdir=`dirname "$0"`
#cd $progdir
#HOME=$progdir

#remove all  , no will trash the @tools
#rm -f /mnt/SDCARD/Roms/PICS/*
cd /mnt/SDCARD/Screenshots
find . -type f -name "*.phf" -exec rm -f {} \;

#will keep @tools with content
#find  -type d -delete
find  -type d -exec rmdir {} \;
rm -f *cache*.db

export picdir="/mnt/SDCARD/Screenshots"
cd $picdir
export phfdir="/mnt/SDCARD/Screenshots"

#xcopy /t /e ../PICS
echo find -type d -regex -print0 -exec mkdir ${phfdir}/{} \;
find -type d -print0 -exec mkdir ${phfdir}/{} \;

#then fake the files
#echo find -type f -regex '.*\.\(jpg\|png\)' -print0 -exec touch ${phfdir}/{}.phf \;
#find -type f -regex '.*\.\(jpg\|png\)' -print0 -exec echo ${phfdir}/{}.phf \;

echo 123
#find -type f -regex '.*\.\(jpg\|png\)' -print0 -exec touch ${phfdir}/{}.phf \;

echo 145
find -type f -regex '.*\.\(jpg\|png\)' -print0 -exec sh -c  'touch "${phfdir}${1%.*}.ph@${1##*.}" ' sh {} \;
echo 789


#find -type f -regex '.*\.\(jpg\|png\)' -print0 -exec sh -c 'echo "${1%.*}.ph@${1##*.}" ' sh {} \;
#find -type f -regex '.*\.\(jpg\|png\)' -print0 -exec sh -c 'touch "${1%.*}.ph@${1##*.}" ' sh {} \;
#touch ${phfdir}/{}.phf \;

#find . -type f -iname "*.jpg" -o -name "*.png"
#find . -type f -regex '.*\.(\jpg|\png)'

