echo currentdir : $PWD
echo shelldir : `dirname $0`
cd `dirname $0`
bin=mkxp-z.aarch64 ./launch.sh "$*"
