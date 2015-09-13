#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

cd "$DOTVIMHOME" 
# ------------------------ 

# pathogen.vim 
# echo "Updating VIM plugins manager..."
# ./scripts/update_pathogen.sh

# vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git $DOTVIMHOME/bundle/Vundle.vim

# ------------------------ 
cd -
byebye "$@"
