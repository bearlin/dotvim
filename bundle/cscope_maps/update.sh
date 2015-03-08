#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Reference: 
# http://derekingrouville.com/2012/cscope-will-change-the-way-you-code/
# http://cscope.sourceforge.net/cscope_vim_tutorial.html

hasWget=0
hasCurl=0

which wget &>/dev/null
if [ $? -eq 0 ]; then
  hasWget=1
fi

which curl &>/dev/null
if [ $? -eq 0 ]; then
  hasCurl=1
fi
echo "hasWget=$hasWget"
echo "hasCurl=$hasCurl"

if [ $hasWget == 0 ] && [ $hasCurl == 0 ]; then
  byebye "Both wget/crul commands not found, please install one of them first."
fi

rm -rf plugin

# Current version: http://cscope.sourceforge.net/cscope_maps.vim 
if [ $hasWget == 1  ]; then
  wget "http://cscope.sourceforge.net/cscope_maps.vim" -O "cscope_maps.vim"
elif [ $hasCurl == 1  ]; then
  curl -o "cscope_maps.vim" "http://cscope.sourceforge.net/cscope_maps.vim"
else
  die "Unknow parameters, exit"
fi

mkdir plugin
mv cscope_maps.vim plugin

byebye

