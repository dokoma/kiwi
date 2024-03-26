#!/bin/sh
echo $0 $*
FN=${0/.sh}
CMD=${FN#*_}
echo CMD=$CMD FN=$FN

progdir=$(dirname $1)
cd $progdir

echo GLOBALDIR=$GLOBALDIR

echo ===== PWD=$PWD =====
if [ "x$GLOBALDIR" = "x" ] ;then 
  export GLOBALDIR=/mnt/SDCARD/Kiwi
  export PATH=$GLOBALDIR/bin:$PATH
  #../PORTS_Data/saltandsanctuary/gamedata/lib64:
  export LD_LIBRARY_PATH=./libs:${GLOBALDIR}/libs:$LD_LIBRARY_PATH
  echo init once!!
fi
echo LD_LIBRARY_PATH=$LD_LIBRARY_PATH
echo PATH=$PATH

#text text1 text_viewer text_viewer1 text_viewer.bin printstr

cd /mnt/SDCARD/Kiwi/cmder
args="./DinguxCommander"
for arg in $args ; do
      echo $arg "$1"
       $arg --loadfile "$1" --loadmode w
done