#!/bin/sh

source /kiwi/mine/SMTP
MAIL_LOG_FILE=/kiwi/logs/mail.txt
#PATH=$PATH:/kiwi/bin

sesAccess=$MAIL_FROM
sesSecret=$MAIL_PASSWORD   
sesSMTP=$MAIL_SMTP

sesFromName="My Daemon"
sesFromAddress=$MAIL_FROM

sesToName="My Receiver"
sesToAddress="$1"
sesSubject="$2"

sesMessage="$3"
sesFile="$4"	  
if [ "$#" -gt "4" ]; then
sesFileName="filename=$5;"
fi
sesMIMEType=`file --mime-type "$sesFile" | sed 's/.*: //'`
echo SEND to : $sesToAddress . $4 $sesMIMEType

curl-aarch64 --connect-timeout 10 --url $sesSMTP --ssl-reqd  \
--mail-from $sesFromAddress --mail-rcpt $sesToAddress  \
--user $sesAccess:$sesSecret \
-F '=(;type=multipart/mixed' \
-F "=$sesMessage;type=text/plain" \
-F "file=@$sesFile;${sesFileName}type=$sesMIMEType;encoder=base64" \
-F '=)' \
-H "Subject: $sesSubject" \
-H "From: $sesFromName <$sesFromAddress>" \
-H "To: $sesToName <$sesToAddress>"

result=$?
echo SEND RESULT :$result [to $1 with file $4]  | tee -a $MAIL_LOG_FILE
exit $result
