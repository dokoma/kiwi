#!/bin/sh
export GLOBALDIR=/mnt/SDCARD/Kiwi
export LD_LIBRARY_PATH=${dir}/libs:${GLOBALDIR}/libs:$LD_LIBRARY_PATH
export PATH=$GLOBALDIR/bin:$PATH
# ps | grep screenshot | grep -v grep 
n=$(ps | grep screenshot | grep -v grep | wc -l)
echo n=====$n
if [[ $n -gt 0 ]]; then
	echo find $n process to kill
	killall screenshot
        sleep 1
	ps | grep screenshot | grep -v grep | wc -l
	n2=$(ps | grep screenshot | grep -v grep | wc -l)
	if [[ $n2 -gt 0 ]]; then
          echo n2=$n2
          result=$?
	  info="SnapshotDaemon kill failed! Maybe still alive!"
        else 
          result=$?
          info="Snapshot Daemon is OFF now!"
	fi
else
	echo no screenshot process, try start	
	screenshot 2>&1 &
#	screenshot&
	result=$?
	if [ $result -eq 0 ]; then
	  info="Starting... 

Snapshot Daemon is ON now!

PRESS L2 + R2 to snap to SDCARD/Screenshots/*.png. 

Press Any Key to Continue."
        else
         info="Start Failed:$result "
	fi
fi

#TODO if exits UI then show feedback with text1, else stdout/stderr only, 
#and maybe tee and do further deal from log.
echo "$info"
text1 "$info"
exit $result	
