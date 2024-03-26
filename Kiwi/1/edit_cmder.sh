#!/bin/sh
cd /kiwi/cmder
source /kiwi/env
./DinguxCommander --loadfile $1 --loadmode w
result=$?
exit $result
