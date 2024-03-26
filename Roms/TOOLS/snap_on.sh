#!/bin/sh
export GLOBALDIR=/mnt/SDCARD/Kiwi
export LD_LIBRARY_PATH=${dir}/libs:${GLOBALDIR}/libs:$LD_LIBRARY_PATH
export PATH=$GLOBALDIR/bin:$PATH
# ps | grep screenshot | grep -v grep 
n=$(ps | grep screenshot | grep -v grep | wc -l)
if [[ $n -gt 0 ]]; then
	text1 "FEEL FREE: Daemon is still ON."
else
	echo no screenshot process, try start	
	screenshot&
	result=$?
	if [[ $result -eq 0 ]]; then
	  text1 "DONE: Daemon is ON. press select+L1 to snap to /Screenshots/*.png."
	else
	  text1 "FAIL: Daemon start error. see log for details."
	fi
	exit $result	
fi
exit 0

