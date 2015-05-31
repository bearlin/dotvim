#!/bin/bash

# Usage: Other scripts can include functions of this file using:
# DOTVIMHOME=~/.vim
# source $DOTVIMHOME/scripts/handy_functions.sh

warn() {
  echo "$1" >&2
}
die() {
  warn "$1"
  exit 1
}
byebye() {
  echo -e "\t=======\t"
  if [ $# -gt 0 ]; then
    echo -e "\t$1\t"
  fi
  echo -e "\tByeBye!\t"
  echo -e "\t=======\t"
  exit 0
}

hasCommandWget() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  retval=0
  which wget &>/dev/null
  if [ $? -eq 0 ]; then
    retval=1
  fi
  return "$retval"
}
hasCommandCurl() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  retval=0
  which curl &>/dev/null
  if [ $? -eq 0 ]; then
    retval=1
  fi
  return "$retval"
}
hasCommandUnzip() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  retval=0
  which unzip &>/dev/null
  if [ $? -eq 0 ]; then
    retval=1
  fi
  return "$retval"
}
setFlagsHasWgetHasCurlAndExitIfBothEqualZero() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  hasCommandWget
  hasWget=$?
  hasCommandCurl
  hasCurl=$?
  if [ $hasWget == 0 ] && [ $hasCurl == 0 ]; then
    byebye "Both wget/crul commands not found, please install one of them first."
  fi
}
setFlagsHasUnzipAndExitIfEqualZero() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  hasCommandUnzip
  hasUnzip=$?
  echo "hasUnzip=$hasUnzip"
  if [ $hasUnzip == 0 ]; then
    die "unzip commands not found, please install unzip first."
  fi
}
