#!/bin/sh
#progdir=`dirname "$0"`
progdir=/mnt/SDCARD/Kiwi/filebrowser
cd "$progdir"
echo ${PWD}
./filebrowser -p 80 &
result=$?
ip=$(ifconfig wlan0)
/mnt/SDCARD/kiwi/bin/text1 "$ip"
exit $result
