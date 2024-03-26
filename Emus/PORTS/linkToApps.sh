#!/bin/sh													  
echo come here parameters $0 $*
#recursive the dirs in scanfiles also
DATA_DIR=/mnt/SDCARD/Vault/PORTS

#force-rebuild-config 
#force-rebuild-link

#read from m3u
toolsname=@tools
echo "$1"	   
#the m3u or the tool file location
FOLDER=${1%/*}
#PARENT=$(dirname "${FOLDER}")
#then last foldername of file location
PNAME=$(basename "${FOLDER}")
#echo "=========${FOLDER} =====${PARENT}======${PNAME}"

FN=${1/.m3u}
GN=${FN##*/}

echo FN=$FN GN=$GN

PATH=/kiwi/bin:$PATH
  #if is .m3u
  if [ "${PNAME}" = "${toolsname}" ]; then
     #cd $FOLDER 
     #source $1
     echo pass  @{toolsname}
  else 
	  pa=$(cat $1)
	  cd $pa
	  echo PWD is : $PWD
	  title="$GN"

#exists maybe
		result=-1

		#then link to UDISK apps
		if [ ! -L "/mnt/UDISK/Apps/$title" ]; then
		#ln -s $/mnt/SDCARD/Vault/PORTS/$title /mnt/UDISK/Apps/$title
		ln -s $PWD /mnt/UDISK/Apps/$title
		result=$?
		fi

		if [ "$result" -eq "0" ]; then
		  text1 "NOW GOTO APPS TO SEE IF IT IS THERE.
		   TRY ADD PICTURE: $title.png in the game-dir or 
		   Modify config.json,set title to whatever you like."
		else
		  text1 "IT'S MAYBE ALREADY THERE."
		fi

  fi

	  #~ #if not exists config.json then add one
		#~ if [ ! -f "config.json" ]; then
			#~ sed "s/placeholder/$foldername/" /kiwi/tpl/config.json.apps > config.json
		#~ fi





