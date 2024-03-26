#echo mu | tr a-z A-Z
#echo ${greet-hello}
#echo ${greet:-hello}  

DIR=${1-PALM1}
core=${2-mu2}

cd `dirname $0`

if [ ! -d /mnt/SDCARD/Emus/$DIR ] ; then
mkdir /mnt/SDCARD/Emus/$DIR
mkdir /mnt/SDCARD/Roms/$DIR
mkdir /mnt/SDCARD/Imgs/$DIR

sed "s/FBNEO/${DIR}/" config.json >/mnt/SDCARD/Emus/$DIR/config.json
sed "s/FBNEO/${DIR}/" launch.sh | sed "s/fbneo/${core}/"  >/mnt/SDCARD/Emus/$DIR/launch.sh

cd  /mnt/SDCARD/Emus/$DIR
 echo done : $PWD
else 
   echo  /mnt/SDCARD/Emus/$DIR already exists.
fi
