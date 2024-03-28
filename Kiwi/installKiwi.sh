#!/bin/sh
export KIWI_DIR=/mnt/SDCARD/Kiwi
if [ "x$1" != "x" ]; then
  export KIWI_DIR=$1
fi

#if [ ! -L "/kiwi" ];then
  ln -sf $KIWI_DIR /kiwi
#fi

#prepare for portmaster
mkdir -p /roms

if [ ! -L "/roms/ports" ];then
  ln -s /mnt/SDCARD/Vault/PORTS /roms/ports
fi

cd /kiwi/install

# the ugly controller icon to transparent, prevent from the icon being collapsed
cp -f /kiwi/install/ic-game-580.png /usr/trimui/res/skin/

source ./ssl_certs.sh
source ./file.sh

if [ ! -f "/bin/bash" ];then
  cp ./bash /bin/
fi
