# !/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# References:
# http://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup

echo "Update git configurations..."

# Your Identity
git config --global user.name "BearLin"
git config --global user.email "bear.lin.001@gmail.com"

# Your Editor
git config --global core.editor vim

# Checking Your Settings
#git config --list
git config user.name
git config user.email
git config core.editor

byebye
