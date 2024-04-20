#!/bin/sh
echo come here parameters $0 $*
echo ------------------------------------------------------------------------
ROM_DIR=/mnt/SDCARD/Roms
EMU_DIR=$(dirname $0)

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
	if [ ! -d $pa ]; then
          info="gamedir $pa not exists, 
Press anykey to exit"
          result = -1
          echo $info
          text1 "$info"
          exit $result
        fi
        
	  cd $pa
          result=-1
	  if [ -f "$GN-guide.png" ] ; then 
		intro="show.elf $GN-guide.png"
	  elif  [ -f "guide.png" ] ; then 
		intro="show.elf ./guide.png"
	  elif  [ -f "screenshot.jpg" ] ; then 
		intro="pic2fb ./screenshot.jpg"
	  elif  [ -f "loading.png" ] ; then 
		#auto close when game start graphics
		intro="pic2fb ./loading.png"
		#need press O key when png specified, and a little bit slow
		#intro="show.elf ./loading.png"
          else 
                intro="pic2fb /kiwi/icon/loading.png"
                #do not support gif, and pic2fb support but do not animate
                #intro="show.elf /kiwi/icon/loader1.gif"
		#intro="show.elf"
	  fi
	  echo ==${intro}=========== PWD is : $PWD ============================
          ${intro} 
# Ensure the conf directory exists
mkdir -p "conf"
# Set the XDG environment variables for config & savefiles
export XDG_CONFIG_HOME="$CONFDIR"
#export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_DATA_HOME=${pa}
export LD_LIBRARY_PATH="$EMU_DIR/libs:/roms/ports/to_the_moon/libs:/usr/trimui/lib:/usr/lib"

if [ ! -d preload ]; then
  echo === no preload cp here
  cp -r $EMU_DIR/preload .
fi

if [ ! -f mkxp.conf ]; then
  echo === no conf cp here
  cp $EMU_DIR/mkxp.conf .
fi

sed -i 's/frameSkip=true/frameSkip=false/' mkxp.conf

#bin=mkxp-z.aarch64
bin=mkxp.bin.freebird
if [ ! -f $bin ]; then
  echo === no bin cp here
  cp $EMU_DIR/$bin .
fi

if [ -f "conf.gptk" ]; then
 gptk="-c ./conf.gptk" 
fi

$EMU_DIR/gptokeyb -k "$bin" $gptk &

./$bin --gameFolder="$pa" --vsync=true --fixedFramerate=60
kill -9 $(pidof gptokeyb)
          result=$?
          echo result=$result
fi
