#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Reference: 
# http://derekingrouville.com/2012/cscope-will-change-the-way-you-code/
# http://vim.sourceforge.net/scripts/script.php?script_id=157

cd "$DOTVIMHOME" 
# ------------------------ 

hasWget=0
hasCurl=0
setFlagsHasWgetHasCurlAndExitIfBothEqualZero "$@"
echo "hasWget=$hasWget"
echo "hasCurl=$hasCurl"

rm -rf bundle/autoload_cscope/plugin
mkdir bundle/autoload_cscope/plugin

# Current version: 0.5 2011-01-27
if [ $hasWget == 1  ]; then
  wget "http://vim.sourceforge.net/scripts/download_script.php?src_id=14884" -O "bundle/autoload_cscope/plugin/autoload_cscope.vim"
elif [ $hasCurl == 1  ]; then
  curl -LSso "bundle/autoload_cscope/plugin/autoload_cscope.vim" "http://vim.sourceforge.net/scripts/download_script.php?src_id=14884"
else
  die "Unknow parameters, exit"
fi

# ------------------------ 
cd -
byebye "$@"
