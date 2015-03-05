#!/bin/bash

# Reference: 
# http://derekingrouville.com/2012/cscope-will-change-the-way-you-code/
# http://vim.sourceforge.net/scripts/script.php?script_id=157

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
  echo "Both wget/crul commands not found, please install one of them first."
  exit 0
fi

rm -rf plugin

# Current version: 0.5 2011-01-27
if [ $hasWget == 1  ]; then
  wget "http://vim.sourceforge.net/scripts/download_script.php?src_id=14884" -O "autoload_cscope.vim"
elif [ $hasCurl == 1  ]; then
  curl -o "autoload_cscope.vim" "http://vim.sourceforge.net/scripts/download_script.php?src_id=14884"
else
  echo "Unknow parameters, exit"
  exit 0
fi

mkdir plugin
mv autoload_cscope.vim plugin

echo "bye!"

