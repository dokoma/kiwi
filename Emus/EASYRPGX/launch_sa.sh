#!/bin/sh
#EMU_DIR=/mnt/SDCARD/Emus/EASYRPG
EMU_DIR=$(dirname $0)
export LD_LIBRARY_PATH=$EMU_DIR/libs:/usr/trimui/lib:$LD_LIBRARY_PATH
gamedir=/mnt/SDCARD/Roms/EASYRPG
cd $gamedir
$EMU_DIR/easyrpg-player 
