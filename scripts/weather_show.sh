#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Reference: 
# https://github.com/chubin/wttr.in

usage() {
  echo "Usage: " && \
  echo "Show weather of Taipei city: ./$0"
  echo "Show weather of [city]: ./$0 [city]"
}

hasCommandCurl
hasCurl=$?
# echo "hasCurl=$hasCurl"

if [ $hasCurl == 1  ]; then
  CITY="Taipei"
  # echo "#=$#"
  if [ "$#" -eq 1 ]; then
    CITY="$1"
  fi
  # echo "CITY=$CITY"

  curl http://wttr.in/"$CITY"
else
  die "Unknow parameters, exit"
fi

# byebye "$@"
