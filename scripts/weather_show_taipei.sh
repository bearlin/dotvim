#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Reference: 
# https://github.com/chubin/wttr.in

hasCommandCurl
hasCurl=$?
# echo "hasCurl=$hasCurl"

if [ $hasCurl == 1  ]; then
  curl http://wttr.in/taipei
else
  die "Unknow parameters, exit"
fi

# byebye "$@"
