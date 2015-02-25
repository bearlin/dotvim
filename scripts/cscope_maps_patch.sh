#!/bin/bash

# Do some patch to cscope_maps.vim. 
# I would like to use F7 key for cscope key mapping trigger.
echo "Patching to cscope_maps.vim..."

# Change "<C-\>" to "<F7>"
sed -i 's/C-\\/F7/g' ~/.vim/bundle/cscope_maps/plugin/cscope_maps.vim 
# Change "<C-@>" to "<F7>7"
sed -i 's/<C-@>/<F7>7/g' ~/.vim/bundle/cscope_maps/plugin/cscope_maps.vim
# Change "^<C-R>" to "<C-R>7"
sed -i 's/\^<C-R>/<C-R>/g' ~/.vim/bundle/cscope_maps/plugin/cscope_maps.vim
# Change "<CR>$<CR>" to "<CR><CR>"
sed -i 's/<CR>$<CR>/<CR><CR>/g' ~/.vim/bundle/cscope_maps/plugin/cscope_maps.vim

echo "Done!"
