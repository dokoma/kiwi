#!/bin/sh
EMUDIR=$(dirname "$0")
cd $(dirname "$1")

GAMEDIR=$(dirname "$1")
CONFDIR="$GAMEDIR/conf/"
# Ensure the conf directory exists
mkdir -p "$GAMEDIR/conf"

# Do not know if needs
# Set the XDG environment variables for config & savefiles
export XDG_CONFIG_HOME="$CONFDIR"
export XDG_DATA_HOME="$CONFDIR"
export FRT_NO_EXIT_SHORTCUTS=FRT_NO_EXIT_SHORTCUTS

file=$(basename "$1")
title=${file%.*}

echo file = $file , title= $title
# default runtime
runtime="frt_3.5.2"
if [ -f ${title}.runtime ]; then
   runtime=`cat ./${title}.runtime`
fi

if [ -f ${title}.patch ]; then
  source ./${title}.patch
fi

export LD_LIBRARY_PATH=$PWD/libs:$LD_LIBRARY_PATH

# show guide if exists
if [ -f ${title}-guide.png ]; then
  /kiwi/bin/show.elf ${title}-guide.png
fi

# Each a gptk if exists
gptk=" "
echo PWD= $PWD
if [ -f ${title}.gptk ]; then
   gptk=" -c ./${title}.gptk"
fi

#cat ./${title}.gptk
#use "" cause gptk not functioned. but print as normal
echo $EMUDIR/gptokeyb -k "$runtime" "$gptk" 
$EMUDIR/gptokeyb -k "$runtime" $gptk &

#SDL_GAMECONTROLLERCONFIG="$sdl_controllerconfig" 

echo $EMUDIR/"$runtime"  -f --resolution 1280x720  --main-pack "$1"
$EMUDIR/"$runtime"  -f --resolution 1280x720  --main-pack "$1"

$ESUDO kill -9 $(pidof gptokeyb)
