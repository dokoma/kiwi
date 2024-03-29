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
          result=-1
	  if [ -f "$GN-guide.png" ] ; then 
		intro="$GN-guide.png"
	  elif  [ -f "guide.png" ] ; then 
		intro="./guide.png"
	  fi

	  echo ==${intro}=========== PWD is : $PWD ============================
          echo show.elf ${intro} 
	  if [ -f "launch_$GN.sh" ]; then
             show.elf ${intro} 
             ./launch_$GN.sh 
	  elif [ -f "launch.sh" ]; then
             show.elf ${intro} 
             ./launch.sh 
          fi
          result=$?
          echo result=$result
  fi

