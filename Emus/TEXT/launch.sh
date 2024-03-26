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

GAMEDIR=/mnt/SDCARD/Kiwi
export LD_LIBRARY_PATH="$GAMEDIR/libs:$progdir/libs:/usr/trimui/lib"

# do not use fall back , less english chars. mycode not merge the default font
# $GAMEDIR/bin/text_viewer -w -f 24 -n $GAMEDIR/cmder/res/DroidSansFallback.ttf $1
# $GAMEDIR/cmder/text_viewer.bin -c 1 -j 1 -f 24 -n $GAMEDIR/cmder/res/DroidSansFallback.ttf $1

#full still slow, PingFang less TraditionalChinese fonts, use J to makeup
# $GAMEDIR/cmder/text_viewer.bin -w -f 24 -u 1 -n $GAMEDIR/fonts/PingFangRegular.ttf $1
# $GAMEDIR/cmder/text_viewer.bin -c 1 -j 1 -f 24 -n $GAMEDIR/fonts/PingFangMedium.ttf $1
# $GAMEDIR/cmder/text_viewer.bin -o 1 -j 1 -f 24 -n $GAMEDIR/fonts/msyh.ttf $1
# $GAMEDIR/cmder/text_viewer.bin -u 1 -j 1 -f 16 -n $GAMEDIR/fonts/msyh.ttf $1
cd  $GAMEDIR/cmder/

./DinguxCommander1 $1
