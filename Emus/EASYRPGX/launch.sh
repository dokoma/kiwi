#!/bin/sh
#echo "===================================="
echo ============cmd:$EMU_DIR/easyrpg_libretro.so $*
RA_DIR=/mnt/SDCARD/RetroArch
#EMU_DIR=/mnt/SDCARD/Emus/EASYRPG
EMU_DIR=$(dirname $0)
cd $RA_DIR/

gamedir=$(dirname $1)
export LD_LIBRARY_PATH=$EMU_DIR/libs:/usr/trimui/lib:$LD_LIBRARY_PATH
#$EMU_DIR/easyrpg-player --project-path $1
#$EMU_DIR/easyrpg-player --help
HOME=$RA_DIR/ $RA_DIR/ra64.trimui -v $NET_PARAM -L $EMU_DIR/easyrpg_libretro.so "$*"
#k version depend on libfluidsynth.so.3  higher than this

#cp $RA_DIR/.retroarch/cores/easyrpg_libretro.so  $EMU_DIR/easyrpg_libretro.so.backup
#cp $EMU_DIR/easyrpg_libretro.so $RA_DIR/.retroarch/cores/
#HOME=$RA_DIR/ $RA_DIR/ra64.trimui -v $NET_PARAM -L $RA_DIR/.retroarch/cores/easyrpg_libretro.so "$*"
