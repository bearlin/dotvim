#!/bin/bash

# Undo patch to cscope_maps.vim. 
echo "Unpatching to cscope_maps.vim..."

git checkout ~/.vim/bundle/cscope_maps/plugin/cscope_maps.vim

echo "Done!"
