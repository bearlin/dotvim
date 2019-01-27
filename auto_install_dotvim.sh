#!/bin/bash

# References:
# https://github.com/vgod/vimrc/blob/master/auto-install.sh
# http://stackoverflow.com/questions/59838/check-if-a-directory-exists-in-a-shell-script

DOTVIMHOME=~/.vim
warn() {
  echo "$1" >&2
}
die() {
  warn "$1"
  exit 1
}
printCurrentScriptRuntimeInfo() {
  printf '\t'
  for argument in "$0 $@"
  do
    printf '%s ' $argument
  done
  printf '\n'
}
byebye() {
  echo -e "\t=======\t"
  printCurrentScriptRuntimeInfo "$@"
  echo -e "\tByeBye!\t"
  echo -e "\t=======\t"
  echo
  echo
  exit 0
}
usage() {
  echo "Usage: " && \
  echo "./auto_install_dotvim.sh" && \
  echo "./auto_install_dotvim.sh force (NOTE: this will force remove ~/.vim ~/.vimrc and ~/.gvimrc)" 
}

DOTVIMRC=~/.vimrc
#echo "DOTVIMHOME=$DOTVIMHOME"
#echo "DOTVIMRC=$DOTVIMRC"

if [ "$1" == "force" ]; then
  echo "Force remove $DOTVIMHOME $DOTVIMRC"
  rm -rf $DOTVIMHOME $DOTVIMRC
fi

VIMRC_SRC=default.vimrc
if [ "$2" == "php" ]; then
  VIMRC_SRC=php.vimrc
fi
echo "Use $VIMRC_SRC"


[ -e "$DOTVIMHOME/vimrc" ] && warn "$DOTVIMHOME/vimrc already exists." && usage && die "exit!"
[ -e "$DOTVIMHOME/gvimrc" ] && warn "$DOTVIMHOME/gvimrc already exists." && usage && die "exit!"
[ -d "$DOTVIMHOME" ] && warn "$DOTVIMHOME already exists." && usage && die "exit!"
[ -L "$DOTVIMRC" ] && warn "$DOTVIMRC already exists." && usage && die "exit!"

git clone https://github.com/bearlin/dotvim.git "$DOTVIMHOME" 

cd "$DOTVIMHOME" 
# ------------------------ 
# Disabled because migrated plugin manager from Vundle to vim-plug
# ./scripts/update_plugin_manager.sh #// Repleced by vim-plug

./scripts/update_pre_downloaded_plugins.sh
./scripts/cscope_maps_patch.sh

ln -s $DOTVIMHOME/$VIMRC_SRC $DOTVIMRC
# ------------------------ 

# Install all vim plugins
vim +PlugInstall +qall

cd -
byebye "$@" "bearlin's dotvim is installed!"

