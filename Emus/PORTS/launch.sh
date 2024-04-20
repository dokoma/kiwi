#!/bin/sh
echo come here parameters $0 $*
echo ------------------------------------------------------------------------
#PORT_DIR=/mnt/SDCARD/Roms/PORTS/Data
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
		intro="show.elf $GN-guide.png"
	  elif  [ -f "guide.png" ] ; then 
		intro="show.elf ./guide.png"
	  elif  [ -f "loading.png" ] ; then 
		#auto close when game start graphics
		intro="pic2fb ./loading.png"
		#need press O key when png specified, and a little bit slow
		#intro="show.elf ./loading.png"
	  elif  [ -f "screenshot.jpg" ] ; then 
		intro="pic2fb ./screenshot.jpg"
          else 
                intro="pic2fb /kiwi/icon/loading.png"
                #do not support gif, and pic2fb support but do not animate
                #intro="show.elf /kiwi/icon/loader1.gif"
		#intro="show.elf"
	  fi

	  echo ==${intro}=========== PWD is : $PWD ============================

	  if [ -f "launch_$GN.sh" ]; then
              ${intro} 
             ./launch_$GN.sh 
	  elif [ -f "launch.sh" ]; then
              ${intro} 
             ./launch.sh 
          fi
          result=$?
          echo result=$result
  fi


