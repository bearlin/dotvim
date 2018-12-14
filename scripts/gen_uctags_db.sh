#!/bin/bash

DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

usage() {
  echo "Usage: " && \
  echo "Init universal-ctags files: $0 init-php" && \
  echo "Clear universal-ctags files: $0 clean"
}

if [ "$#" -lt 1 ]; then
  usage
  byebye "$@"
fi

if [ "$1" == "init-php" ] || 
   [ "$1" == "clean" ]; then
  echo "para=$1"
else
  die "Unknow parameters \"$1\", exit!"
fi

#hasGtags=0
#setFlagsHasGtagsAndExitIfEqualZero "$@"
#echo "hasGtags=$hasGtags"

if [ "$1" == "clean" ]; then
  echo "clean generated universal-ctags files in current folder..."
  rm tags
elif [ "$1" == "init-php" ]; then
  echo "Build the database..."
  #ctags --tag-relative=yes -R -f "tags" --fields=+aimlS --languages=php --PHP-kinds=+cdfint-av --exclude=composer.phar --exclude=*Test.php --exclude=*phpunit* --exclude="\.git"
  ctags --tag-relative=yes -R -f "tags" --fields=+aimlS --languages=php --PHP-kinds=+cdfint-av --exclude=composer.phar --exclude="\.git"
else
  usage
  byebye "$@"
fi

byebye "$@"
