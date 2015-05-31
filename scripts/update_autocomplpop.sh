#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Reference: 
# http://www.vim.org/scripts/script.php?script_id=1879

cd "$DOTVIMHOME" 
# ------------------------ 

hasWget=0
hasCurl=0
setFlagsHasWgetHasCurlAndExitIfBothEqualZero "$@"
echo "hasWget=$hasWget"
echo "hasCurl=$hasCurl"

rm -rf `find bundle/autocomplpop/ -name "*zip*" -o -name "*autoload*" -o -name "*doc*" -o -name "*plugin*"`
#rm -rf `find bundle/autocomplpop/ -name "*autocomplpop*" -o -name "*zip*" -o -name "*autoload*" -o -name "*doc*" -o -name "*plugin*" -o -name "*.hg*" `

# Current version: 2.14.1 2009-12-12
if [ $hasWget == 1  ]; then
  wget "http://www.vim.org/scripts/download_script.php?src_id=11894" -O "bundle/autocomplpop/vim-autocomplpop.zip" 
elif [ $hasCurl == 1  ]; then
  curl -LSso "bundle/autocomplpop/vim-autocomplpop.zip" "http://www.vim.org/scripts/download_script.php?src_id=11894" 
else
  die "Unknow parameters, exit"
fi

hasUnzip=0
setFlagsHasUnzipAndExitIfEqualZero "$@"
echo "hasUnzip=$hasUnzip"

unzip bundle/autocomplpop/vim-autocomplpop.zip -d bundle/autocomplpop/
#extractDir=`ls -d ns*`
#echo "extractDir=$extractDir"
#mv $extractDir/* .
#mv $extractDir/.hg* .
#rmdir $extractDir
rm -rf bundle/autocomplpop/vim-autocomplpop.zip

# ------------------------ 
cd -
byebye "$@"
