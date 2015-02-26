#!/bin/bash

# Reference: http://derekingrouville.com/2012/cscope-will-change-the-way-you-code/

rm -rf plugin
#wget http://cscope.sourceforge.net/cscope_maps.vim 
curl -o cscope_maps.vim http://cscope.sourceforge.net/cscope_maps.vim 

mkdir plugin
mv cscope_maps.vim plugin
