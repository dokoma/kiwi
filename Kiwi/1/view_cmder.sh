#!/bin/sh
cd /kiwi/cmder
source /kiwi/env
./DinguxCommander --loadfile $1 --loadmode r
result=$?
exit $result
