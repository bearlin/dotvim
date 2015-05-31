#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# pathogen.vim 
echo "Updating pathogen.vim in ~/.vim/autoload/..."
cd $DOTVIMHOME/autoload/
./update_pathogen.sh
cd -

byebye "$@"
