#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Undo patch to cscope_maps.vim. 
echo "Unpatching to cscope_maps.vim..."

git checkout $DOTVIMHOME/bundle/cscope_maps/plugin/cscope_maps.vim

byebye
