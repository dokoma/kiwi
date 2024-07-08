#!/bin/sh
#cd /mnt/SDCARD/Roms/TOOLS

(
sleep 10
a=`pgrep screenshot`
#if it's trimui reload it would start again...
if [ "$a" == "" ] ; then
if [ -f /kiwi/bin/screenshot ]; then
  echo ========================= staring screenshot daemon.
  #sleep 5
  /kiwi/bin/screenshot &
  echo ========================= maybe started.. $?
  ps | grep screenshot
fi
fi
) &
