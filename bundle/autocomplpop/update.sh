#!/bin/bash

# Reference: 
# http://www.vim.org/scripts/script.php?script_id=1879

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

rm -rf `find . -name "*zip*" -o -name "*autoload*" -o -name "*doc*" -o -name "*plugin*"`
#rm -rf `find . -name "*autocomplpop*" -o -name "*zip*" -o -name "*autoload*" -o -name "*doc*" -o -name "*plugin*" -o -name "*.hg*" `

# Current version: 2.14.1 2009-12-12
if [ $hasWget == 1  ]; then
  wget "http://www.vim.org/scripts/download_script.php?src_id=11894" -O "vim-autocomplpop.zip" 
elif [ $hasCurl == 1  ]; then
  curl -o "vim-autocomplpop.zip" "http://www.vim.org/scripts/download_script.php?src_id=11894" 
else
  echo "Unknow parameters, exit"
  exit 0
fi

hasUnzip=0
which unzip &>/dev/null
if [ $? -eq 0 ]; then
  hasUnzip=1
fi
echo "hasUnzip=$hasUnzip"

if [ $hasUnzip == 0 ]; then
  echo "unzip commands not found, please install unzip first."
  exit 0
fi

unzip vim-autocomplpop.zip
#extractDir=`ls -d ns*`
#echo "extractDir=$extractDir"
#mv $extractDir/* .
#mv $extractDir/.hg* .
#rmdir $extractDir
rm -rf vim-autocomplpop.zip

echo "bye!"

