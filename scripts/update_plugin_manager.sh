#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

cd "$DOTVIMHOME" 
# ------------------------ 

# pathogen.vim 
echo "Updating VIM plugins manager..."
./scripts/update_pathogen.sh

# ------------------------ 
cd -
byebye "$@"
