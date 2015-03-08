#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# cscope_maps
echo "Updating cscope_maps..."
cd $DOTVIMHOME/bundle/cscope_maps/ 
./update.sh
cd -

# autoload_cscope
echo "Updating autoload_cscope..."
cd $DOTVIMHOME/bundle/autoload_cscope/  
./update.sh
cd -

# autocomplpop 
echo "Updating autocomplpop..."
cd $DOTVIMHOME/bundle/autocomplpop/  
./update.sh
cd -

byebye
