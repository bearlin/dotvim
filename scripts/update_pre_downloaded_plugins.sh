#!/bin/bash

# cscope_maps
echo "Updating cscope_maps..."
cd ~/.vim/bundle/cscope_maps/ 
./update.sh
cd -

# autoload_cscope
echo "Updating autoload_cscope..."
cd ~/.vim/bundle/autoload_cscope/  
./update.sh
cd -

# autocomplpop 
echo "Updating autocomplpop..."
cd ~/.vim/bundle/autocomplpop/  
./update.sh
cd -
echo "bye!"
