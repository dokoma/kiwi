#!/bin/sh
export KIWI_DIR=/mnt/SDCARD/Kiwi
export VAULT_DIR=/mnt/SDCARD/VAULT

if [ "x$1" != "x" ]; then
  export KIWI_DIR=$1
fi

#if [ ! -L "/kiwi" ];then
  ln -sf $KIWI_DIR /kiwi
#fi

#prepare for portmaster
mkdir -p /roms

if [ ! -L "/roms/ports" ];then
  ln -s $VAULT_DIR/PORTS /roms/ports
fi

cd /kiwi/install

# the ugly controller icon to transparent, prevent from the icon being collapsed
cp -f /kiwi/install/ic-game-580.png /usr/trimui/res/skin/

source ./ssl_certs.sh
source ./file.sh

if [ ! -f "/bin/bash" ];then
  echo adding bash 
  cp ./bash /bin/
fi

if [ ! -f "/kiwi/mine/ENV" ];then
  echo adding  ENV
  cp /kiwi/ENV_SAMPLE /kiwi/ENV
fi

if [ ! -f "/kiwi/mine/SMTP" ];then
  echo adding SMTP 
  cp /kiwi/SMTP_SAMPLE /kiwi/SMTP
fi

echo complete. You may need some initial setting from the /kiwi/ to get email working.
