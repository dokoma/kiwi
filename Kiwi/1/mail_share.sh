#!/bin/sh
source /kiwi/env
source /kiwi/mine/ENV
if [ "$MAILTO_DEFAULT" == "" ]; then
mail-att.sh "$MAILTO_DEFAULT" "Share from TrimUI" "--" $1
result=$?
else
  result=-1
  info=" SET MAILTO_DEFAULT in your /kiwi/mine/SMTP first!"
fi
exit $result
