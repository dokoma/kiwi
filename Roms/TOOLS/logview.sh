#!/bin/sh
dir=$(dirname $0)
GLOBALDIR=/mnt/SDCARD/Kiwi

export LD_LIBRARY_PATH=${dir}/libs:${GLOBALDIR}/libs:$LD_LIBRARY_PATH
export PATH=$GLOBALDIR/bin:$PATH
#default
text_viewer /tmp/.lastlog

#only chinese ?
#./text_viewer -f 24 --font_file $GLOBALDIR/res/DroidSansFallback.ttf ./demo.txt

# chinese 
#./text_viewer -f 26 --font_file res/font.ttf ./demo.txt

#default font but big
#./text_viewer -f 24 ./demo.txt

#default
#./text_viewer /tmp/.lastlog

#dot log
#./text_viewer -f 16 -n res/Fiery_Turk.ttf ./demo.txt

#execute a script
#./text_viewer -f 24 -s ./log.sh
