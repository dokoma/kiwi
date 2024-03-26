#!/bin/sh
echo -------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------
echo parameters $0 $*
echo execute himself is $1

progdir=$(dirname $1)
cd $progdir

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
echo -------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------
 "$1"
