#!/bin/sh
progdir=`dirname "$0"`
#cd $progdir
#HOME=$progdir

#find file directory first as 1st param, current folder replace PICS --> PICS_Data
#picdir="/mnt/SDCARD/Roms/PICS/palm-pics"
#then the selected file  remove the last .phf as second param
#$progdir/showpic.elf "$picdir" "$1"

toolsname=@tools
echo "$1"
FOLDER=${1%/*}
PNAME=$(basename "${FOLDER}")

echo PNAME=$PNAME
echo FOLDER=$FOLDER

export LD_LIBRARY_PATH=$progdir/libs:$/usr/trimui/lib
#LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
  if [ "${PNAME}" = "${toolsname}" ]; then
     cd $FOLDER 
     $1
  else 
	#$progdir/show1.elf "$1/_Data/"
#its in the 2nd position so 
        tmp="${1/PICS/XXXX}"
        #tmp="${tmp/PICS/PICS_Data}"
	tmp="${tmp/PICS/../Data/PICTURE}"
        tmp="${tmp/XXXX/PICS}"
	ext=${tmp##*@}
        tmp=${tmp%.*}        
	echo "$tmp.$ext"
	$progdir/show1.elf "$tmp.$ext"
  fi
