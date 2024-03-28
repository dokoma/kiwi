#!/bin/bash

#proxy and python3
export PATH=/mnt/UDISK/Apps/python37/bin:$PATH
export http_proxy=http://192.168.0.6:10811
export https_proxy=http://192.168.0.6:10811
		
cd $(dirname $0)
source ./PortMaster.sh
