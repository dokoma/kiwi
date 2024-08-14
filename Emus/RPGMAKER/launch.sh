#!/bin/sh
echo come here parameters $0 $*
echo ------------------------------------------------------------------------

ROM_DIR=/mnt/SDCARD/Roms
EMU_DIR=$(cd `dirname $0` && pwd)

bin=${bin:-mkxp.bin.freebird}
echo bin : $bin EMU_DIR: $EMU_DIR PWD: $PWD

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

# Set the XDG environment variables for config & savefiles
#temporary set? if no export ,it wont work.
export XDG_DATA_HOME=${pa}


# z2 for dynamic, z for static , libs other
export LD_LIBRARY_PATH="$EMU_DIR/z:$EMU_DIR/z2:$EMU_DIR/libs:/usr/trimui/lib:/usr/lib"

# no need for mkxp-z in fact.
[ ! -d preload ] && cp -r $EMU_DIR/preload .
[ ! -f mkxp.conf ] && cp $EMU_DIR/mkxp.conf .
[ ! -f conf.gptk ] && cp $EMU_DIR/conf.gptk .
# for z only
[ ! -d scripts ] && cp -r $EMU_DIR/scripts .
[ ! -f mkxp.json ] && cp $EMU_DIR/mkxp.json .

#bin=mkxp-z.aarch64
#bin=mkxp-z.static.tsp
#bin=mkxp.bin.freebird
#[ ! -f $bin ] && cp $EMU_DIR/$bin .
# always lastest bin
cp $EMU_DIR/$bin .
[ -f preload.sh ] && echo "preload exists" && source ./preload.sh
echo $nojs = nojs
if [ "$nojs" = "1" ]; then 
  gptk="-c ./conf.gptk" 
fi
# double S always available
echo GPTK: $EMU_DIR/gptokeyb -k "$bin" $gptk 
$EMU_DIR/gptokeyb -k "$bin" $gptk &

./$bin --gameFolder="$pa"  --fullscreen=true
#--vsync=true --fixedFramerate=60
kill -9 $(pidof gptokeyb)
result=$?
echo result=$result
echo ====== EOF $bin "$*" =======
fi
