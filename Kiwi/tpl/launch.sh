#!/bin/sh
RA_DIR=/mnt/SDCARD/RetroArch
EMU_DIR=/mnt/SDCARD/Emus/FBNEO
CORES=$RA_DIR/.retroarch/cores

cd $RA_DIR/
#$EMU_DIR/cpufreq.sh

core=fbneo
HOME=$RA_DIR/ $RA_DIR/ra64.trimui -v $NET_PARAM -L ${CORES}/${core}_libretro.so "$*"
