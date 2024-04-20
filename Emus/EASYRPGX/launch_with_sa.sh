#!/bin/sh
#EMU_DIR=/mnt/SDCARD/Emus/EASYRPG
EMU_DIR=$(dirname $0)
export LD_LIBRARY_PATH=$EMU_DIR/libs:/usr/trimui/lib:$LD_LIBRARY_PATH
gamedir=$(dirname $1)
cd $gamedir

if [[ "${1##*.}" == "zip" ]]; then 
  echo === $1 is zip
  $EMU_DIR/easyrpg-player --project-path $1
else
  #$EMU_DIR/easyrpg-player --project-path $gamedir
  $EMU_DIR/easyrpg-player  #--encoding big5
fi
