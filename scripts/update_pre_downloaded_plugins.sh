#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# cscope_maps
echo "Updating cscope_maps..."
cd $DOTVIMHOME/bundle/cscope_maps/ 
./update_cscope_maps.sh
cd -

# autoload_cscope
echo "Updating autoload_cscope..."
cd $DOTVIMHOME/bundle/autoload_cscope/  
./update_autoload_cscope.sh
cd -

# autocomplpop 
echo "Updating autocomplpop..."
cd $DOTVIMHOME/bundle/autocomplpop/  
./update_autocomplpop.sh
cd -

byebye
