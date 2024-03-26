#!/bin/sh
dir=$(dirname $0)
cd ${dir}
echo ====================================
echo PWD = ${PWD}

echo   LD_LIBRARY_PATH=${dir}/libs:/kiwi/libs:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=${dir}/libs:/kiwi/libs:$LD_LIBRARY_PATH

echo ./DinguxCommander $@
./DinguxCommander $@


