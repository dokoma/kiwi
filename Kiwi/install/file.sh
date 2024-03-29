#!/bin/sh
if [ ! -f "/usr/bin/file" ];then
echo adding file...
tar zxvf file540.tar.gz -C /usr
ln -s /usr/lib/libmagic.so.1.0.0 /usr/lib/libmagic.so.1
ln -s /usr/lib/libmagic.so.1.0.0 /usr/lib/libmagic.so
ln -s /usr/lib/libzstd.so.1.4.3 /usr/lib/libzstd.so.1
ln -s /usr/lib/libzstd.so.1.4.3 /usr/lib/libzstd.so
chmod +x /usr/bin/file
fi