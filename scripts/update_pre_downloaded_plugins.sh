#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

cd "$DOTVIMHOME" 
# ------------------------ 

# cscope_maps
echo "Updating cscope_maps..."
./scripts/update_cscope_maps.sh

# autoload_cscope
echo "Updating autoload_cscope..."
./scripts/update_autoload_cscope.sh

# autocomplpop 
echo "Updating autocomplpop..."
./scripts/update_autocomplpop.sh

# ------------------------ 
cd -
byebye "$@"
