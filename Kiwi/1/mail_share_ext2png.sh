#!/bin/sh
source /kiwi/env
tmp="${1%.*}.png"
mail-att.sh kanyyu@qq.com ShareScreenshot FromTRIMUI "$tmp"
result=$?
exit $result
