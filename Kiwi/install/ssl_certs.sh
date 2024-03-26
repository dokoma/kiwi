#!/bin/sh
CRTDIR=/etc/ssl/certs
CERT=ca-certificates.crt
if [[ ! -f "$CRTDIR/$CERT" ]]; then
  mkdir -p $CRTDIR
  cp /kiwi/install/$CERT $CRTDIR/
fi