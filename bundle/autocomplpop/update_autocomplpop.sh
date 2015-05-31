#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Reference: 
# http://www.vim.org/scripts/script.php?script_id=1879

hasWget=0
hasCurl=0
getHasCommandWgetCurlAndByebyeIfNoBothCommands
echo "hasWget=$hasWget"
echo "hasCurl=$hasCurl"

rm -rf `find . -name "*zip*" -o -name "*autoload*" -o -name "*doc*" -o -name "*plugin*"`
#rm -rf `find . -name "*autocomplpop*" -o -name "*zip*" -o -name "*autoload*" -o -name "*doc*" -o -name "*plugin*" -o -name "*.hg*" `

# Current version: 2.14.1 2009-12-12
if [ $hasWget == 1  ]; then
  wget "http://www.vim.org/scripts/download_script.php?src_id=11894" -O "vim-autocomplpop.zip" 
elif [ $hasCurl == 1  ]; then
  curl -LSso "vim-autocomplpop.zip" "http://www.vim.org/scripts/download_script.php?src_id=11894" 
else
  die "Unknow parameters, exit"
fi

hasCommandUnzip
hasUnzip=$?
echo "hasUnzip=$hasUnzip"
if [ $hasUnzip == 0 ]; then
  die "unzip commands not found, please install unzip first."
fi

unzip vim-autocomplpop.zip
#extractDir=`ls -d ns*`
#echo "extractDir=$extractDir"
#mv $extractDir/* .
#mv $extractDir/.hg* .
#rmdir $extractDir
rm -rf vim-autocomplpop.zip

byebye
