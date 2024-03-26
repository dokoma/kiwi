#!/bin/sh
#progdir=`dirname "$0"`
progdir=/mnt/SDCARD/Kiwi/filebrowser
cd "$progdir"
echo ${PWD}
ps | grep filebrowser | grep -v grep 
n=$(ps | grep filebrowser | grep -v grep | wc -l)
if [[ $n -gt 0 ]]; then
	echo find $n process to kill
	killall -9 filebrowser
	n2=$(ps | grep filebrowser | grep -v grep | wc -l)
	if [[ $n2 -gt 0 ]]; then
	  echo kill failed.
          exit 1
        else 
          echo killed.
	fi
else
	echo no filebrowser process.
        exit 1
fi
exit 0
