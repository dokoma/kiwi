#!/bin/sh
source /kiwi/env
tmp="${1%.*}.png"
mail-att2me.sh "$tmp"
result=$?
exit $result
