#!/bin/sh
echo -------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------
echo parameters $0 $*
echo execute himself is $1

startdir=$(dirname $0)
progdir=$(dirname $1)
cd $progdir

echo ===== PWD=$PWD =====
export PATH=/kiwi/bin:$PATH
export LD_LIBRARY_PATH=$progdir/libs:/kiwi/libs:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH="/roms/ports/stardewvalley/gl4es:$LD_LIBRARY_PATH"
#export LD_LIBRARY_PATH="/kiwi/libs:${PWD}/lib:/usr/lib:$LD_LIBRARY_PATH"
#LD_LIBRARY_PATH=/roms/ports/stardewvalley/gl4es:$LDLIBRARY_PATH
echo PATH=$PATH
echo LD_LIBRARY_PATH=$LD_LIBRARY_PATH
#export LIBGL_ES=2
#export LIBGL_GL=21
#export LIBGL_FB=4
#export SDL_VIDEO_GL_DRIVER="libGL.so.1"
#export SDL_VIDEO_EGL_DRIVER="libEGL.so.1"
echo -------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------

GPTOKEYB=/roms/ports/PortMaster/gptokeyb
prog=$(basename $1)
echo $GPTOKEYB -k $prog -c $startdir/default.gptk 
$GPTOKEYB -k $prog -c $startdir/default.gptk &
 "$1"
echo kill -9 $(pidof gptokeyb)
kill -9 $(pidof gptokeyb)
