#!/bin/bash

# cscope_maps
cd bundle/cscope_maps/ 
./update.sh
cd -

# autoload_cscope
cd bundle/autoload_cscope/  
./update.sh
cd -

