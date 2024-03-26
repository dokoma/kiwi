#!/bin/sh
export GLOBALDIR=/mnt/SDCARD/Kiwi
export LD_LIBRARY_PATH=${dir}/libs:${GLOBALDIR}/libs:$LD_LIBRARY_PATH
export PATH=$GLOBALDIR/bin:$PATH
# ps | grep screenshot | grep -v grep 
n=$(ps | grep screenshot | grep -v grep | wc -l)
if [[ $n -gt 0 ]]; then
	echo find $n process to kill
	killall -9 screenshot
	n2=$(ps | grep screenshot | grep -v grep | wc -l)
	if [[ $n2 -gt 0 ]]; then
	  echo kill failed.
	  text1 "FAIL: Still Alive!"
          exit 1
        else 
          text1 "DONE: Daemon is OFF now!"
	fi
else
	text1 "FEEL FREE: NO Daemon available."
fi
exit 0

