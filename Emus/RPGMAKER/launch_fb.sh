echo currentdir : $PWD
echo shelldir : `dirname $0`
cd `dirname $0`
bin=mkxp.bin.freebird.nojs nojs=1 ./launch.sh "$*"
