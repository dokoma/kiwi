#!/bin/sh
progdir=`dirname "$0"`
PATH=/kiwi/bin:$PATH
#cd $progdir
#HOME=$progdir


#for file in /mnt/SDCARD/Screenshots/*.png; do
#echo ./show.elf "$file" 3
#./show.elf "$file" 3
#done
picdir="/mnt/SDCARD/Screenshots"
cd $picdir
#ls *.png *.jpg *.bmp | xargs $progdir/show.elf $picdir 

toolsname=@tools
FOLDER=${1%/*}
PNAME=$(basename "${FOLDER}")

echo PARAM="$1"
echo PNAME=$PNAME
echo FOLDER=$FOLDER

export LD_LIBRARY_PATH=$progdir/libs:/kiwi/libs:/kiwi/cmder/libs:/usr/trimui/lib:$LD_LIBRARY_PATH
echo LD_LIBRARY_PATH=$LD_LIBRARY_PATH
#echo P1=${1##*/}

#echo [ "${1##*/}" = "SHOW.pf" ]
#LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

#this need to make it better ... to be as default
find -name "*.png" -print0 | xargs -0 $progdir/show.elf $picdir
exit 0
# no need any more from 1.0.4
  if [ "${PNAME}" = "${toolsname}" ]; then
     cd $FOLDER
     "$1"
  elif [ "${1##*/}" = "0000_SHOW.ph" ]; then
	find -name "*.png" -print0 | xargs -0 $progdir/show.elf $picdir
  else 
        #This move to the x-menu  and not use cmder as default..
        tmp="${1%.*}"
        echo NOEXT_ADD_DOTPNG=$tmp.png
        #$progdir/show1.elf "$tmp.png"
        echo /kiwi/cmder/DinguxCommander --loadfile "$tmp.png"  
        cd /kiwi/cmder/
        ./DinguxCommander --loadfile "$tmp.png"  
  fi
