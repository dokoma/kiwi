RA_DIR=/mnt/SDCARD/RetroArch
EMU_DIR=/mnt/SDCARD/Emus/TIC80
#CORES=$RA_DIR/.retroarch/cores
CORES=$EMU_DIR

cd $RA_DIR/
#$EMU_DIR/cpufreq.sh

core=tic80
HOME=$RA_DIR/ $RA_DIR/ra64.trimui -v $NET_PARAM -L ${CORES}/${core}_libretro.so "$*"
