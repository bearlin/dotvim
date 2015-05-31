#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Reference: 
# https://github.com/tpope/vim-pathogen

cd "$DOTVIMHOME" 
# ------------------------ 

hasWget=0
hasCurl=0
setFlagsHasWgetHasCurlAndExitIfBothEqualZero "$@"
echo "hasWget=$hasWget"
echo "hasCurl=$hasCurl"

rm -rf $DOTVIMHOME/autoload/pathogen.vim

if [ $hasWget == 1  ]; then
  wget "https://tpo.pe/pathogen.vim" -O "$DOTVIMHOME/autoload/pathogen.vim"
elif [ $hasCurl == 1  ]; then
  curl -LSso "$DOTVIMHOME/autoload/pathogen.vim" "https://tpo.pe/pathogen.vim"
else
  die "Unknow parameters, exit"
fi

# ------------------------ 
cd -
byebye "$@"
