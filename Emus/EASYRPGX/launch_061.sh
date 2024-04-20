#!/bin/sh
#echo "===================================="
echo ============cmd:$EMU_DIR/easyrpg_libretro.so $*
RA_DIR=/mnt/SDCARD/RetroArch
#EMU_DIR=/mnt/SDCARD/Emus/EASYRPG
EMU_DIR=$(dirname $0)
cd $RA_DIR/

#export LD_LIBRARY_PATH=$EMU_DIR/libs:/usr/trimui/lib:$LD_LIBRARY_PATH
HOME=$RA_DIR/ $RA_DIR/ra64.trimui -v $NET_PARAM -L $RA_DIR/.retroarch/cores/easyrpg_libretro.so "$*"
