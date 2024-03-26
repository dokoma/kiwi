#!/bin/sh
dir=$(dirname $0)
GLOBALDIR=/mnt/SDCARD/Kiwi
export LD_LIBRARY_PATH=${dir}/libs:${GLOBALDIR}/libs:$LD_LIBRARY_PATH
export PATH=${GLOBALDIR}/bin:$PATH

#default
#test only for the -s , seems limit to the buffer size, will lose some info. and so do tail, will hang the MainUI
#but maybe useful for a puppet  for same name sh in a conventional dir
#text_viewer -f 24 -s ${0}.exe

#tail -n 100 /tmp/.lastlog
{
echo =====Disk Info=====
df -h
echo =====Mount Info=====
mount
echo =====IP Info=====
ifconfig wlan0
} > /tmp/.sysinfo

text_viewer -f 24 /tmp/.sysinfo

#only chinese ?
#./text_viewer -f 24 --font_file res/DroidSansFallback.ttf ./demo.txt

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
