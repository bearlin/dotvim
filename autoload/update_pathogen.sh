#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Reference: 
# https://github.com/tpope/vim-pathogen

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

rm -rf pathogen.vim

if [ $hasWget == 1  ]; then
  wget "https://tpo.pe/pathogen.vim" -O "$DOTVIMHOME/autoload/pathogen.vim"
elif [ $hasCurl == 1  ]; then
  curl -LSso "$DOTVIMHOME/autoload/pathogen.vim" "https://tpo.pe/pathogen.vim"
else
  die "Unknow parameters, exit"
fi

byebye
