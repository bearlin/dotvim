#!/bin/bash
# References:
# https://github.com/vgod/vimrc/blob/master/auto-install.sh
# http://stackoverflow.com/questions/59838/check-if-a-directory-exists-in-a-shell-script

DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

usage() {
  echo "Usage: " && \
  echo "./auto_install.sh" && \
  echo "./auto_install.sh force (NOTE: this will force remove ~/.vim ~/.vimrc and ~/.gvimrc)" && \
}

if [ "$1" -eq "force" ]; then
  rm -rf ~/.vim ~/.vimrc ~/.gvimrc
fi

[ -e "~/.vim" ] && warn "~/.vim already exists." && usage && die "exit!"
[ -e "~/.vimrc" ] && warn "~/.vimrc already exists." && usage && die "exit!"
[ -e "~/.gvimrc" ] && warn "~/.gvimrc already exists." && usage && die "exit!"
[ -e "$DOTVIMHOME/vimrc" ] && warn "$DOTVIMHOME/vimrc already exists." && usage && die "exit!"
[ -e "$DOTVIMHOME/gvimrc" ] && warn "$DOTVIMHOME/gvimrc already exists." && usage && die "exit!"

git clone https://github.com/bearlin/dotvim.git "$DOTVIMHOME" 

cd "$DOTVIMHOME" 
git submodule init
git submodule update
./scripts/update_pre_downloaded_plugins.sh
./scripts/cscope_maps_patch.sh

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

byebye "bearlin's dotvim is installed!"

