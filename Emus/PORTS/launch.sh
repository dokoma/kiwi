#!/bin/sh
echo come here parameters $0 $*
echo ------------------------------------------------------------------------
PORT_DIR=/mnt/SDCARD/Roms/PORTS/Data
ROM_DIR=/mnt/SDCARD/Roms

toolsname=@tools
echo "$1"
FOLDER=${1%/*}
PARENT=$(dirname "${FOLDER}")
PNAME=$(basename "${FOLDER}")
echo "=========${FOLDER} =====${PARENT}======${PNAME}"

FN=${1/.m3u}
GN=${FN##*/}

PATH=/kiwi/bin:$PATH
  #if is .m3u
  if [ "${PNAME}" = "${toolsname}" ]; then
     cd $FOLDER 
     source $1
  else 
	  pa=$(cat $1)
	  cd $pa
	  echo PWD is : $PWD
          result=0
	  if [ -f "guide.png" ]; then
            show.elf guide.png 1
            result=$?
	  fi
          echo $result
         
	  if [ -f "launch_$GN.sh" ]; then
	    ./launch_$GN.sh 
	  elif [ -f "launch.sh" ]; then
	    ./launch.sh 
	  fi
  fi

