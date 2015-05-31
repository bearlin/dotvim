#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Do some patch to cscope_maps.vim. 
# I would like to use F7 key for cscope key mapping trigger.
echo "Do some patching to cscope_maps.vim..."
# Change "<C-\>" to "<F7>"
sed -i'.bak' 's/C-\\/F7/g' $DOTVIMHOME/bundle/cscope_maps/plugin/cscope_maps.vim 
# Change "<C-@>" to "<F7>7"
sed -i'.bak' 's/<C-@>/<F7>7/g' $DOTVIMHOME/bundle/cscope_maps/plugin/cscope_maps.vim
# Change "^<C-R>" to "<C-R>7"
sed -i'.bak' 's/\^<C-R>/<C-R>/g' $DOTVIMHOME/bundle/cscope_maps/plugin/cscope_maps.vim
# Change "<CR>$<CR>" to "<CR><CR>"
sed -i'.bak' 's/<CR>$<CR>/<CR><CR>/g' $DOTVIMHOME/bundle/cscope_maps/plugin/cscope_maps.vim

# Delete sed in place backup file.
rm -rf $DOTVIMHOME/bundle/cscope_maps/plugin/cscope_maps.vim.bak

byebye "$@"
