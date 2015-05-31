#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Reference: 
# http://derekingrouville.com/2012/cscope-will-change-the-way-you-code/
# http://cscope.sourceforge.net/cscope_vim_tutorial.html

cd "$DOTVIMHOME" 
# ------------------------ 

hasWget=0
hasCurl=0
setFlagsHasWgetHasCurlAndExitIfBothEqualZero "$@"
echo "hasWget=$hasWget"
echo "hasCurl=$hasCurl"

rm -rf bundle/cscope_maps/plugin
mkdir bundle/cscope_maps/plugin

# Current version: http://cscope.sourceforge.net/cscope_maps.vim 
if [ $hasWget == 1  ]; then
  wget "http://cscope.sourceforge.net/cscope_maps.vim" -O "bundle/cscope_maps/plugin/cscope_maps.vim"
elif [ $hasCurl == 1  ]; then
  curl -LSso "bundle/cscope_maps/plugin/cscope_maps.vim" "http://cscope.sourceforge.net/cscope_maps.vim"
else
  die "Unknow parameters, exit"
fi

# ------------------------ 
cd -
byebye "$@"
