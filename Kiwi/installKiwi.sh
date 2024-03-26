#!/bin/sh
if [ ! -L "/kiwi" ];then
  ln -s /mnt/SDCARD/Kiwi /kiwi
fi

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