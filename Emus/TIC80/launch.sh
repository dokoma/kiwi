#!/bin/bash
cd $(dirname "$0")
export PATH=$PATH:$PWD/bin
#export LD_LIBRARY_PATH="/roms/ports/stardewvalley/gl4es:/kiwi/libs:${PWD}/lib:/usr/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/kiwi/libs:${PWD}/lib:/usr/lib:$LD_LIBRARY_PATH"
#LD_LIBRARY_PATH=/roms/ports/stardewvalley/gl4es:$LDLIBRARY_PATH
echo PATH=$PATH
echo LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export LIBGL_ES=2
export LIBGL_GL=21
export LIBGL_FB=4
        #export SDL_VIDEO_GL_DRIVER="libGL.so.1"
        #export SDL_VIDEO_EGL_DRIVER="libEGL.so.1"
 

    echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    #mount --bind /mnt/SDCARD/Roms/PICO8 /mnt/SDCARD/Apps/pico/.lexaloffle/pico-8/carts
    /roms/ports/PortMaster/gptokeyb -k "tic80" & 
    #-c /kiwi/tic80.gptk &
    tic80  "$1"  --fullscreen
#./show.elf tic80.png
#player-sdl "$1"
#ldd tic80 --soft
    kill -9 $(pidof gptokeyb)
    #umount /mnt/SDCARD/Apps/pico/.lexaloffle/pico-8/carts
    echo ondemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor


