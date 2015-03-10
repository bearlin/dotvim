# !/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# References:
# http://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup

usage() {
  echo "Usage: " && \
  echo "./$0 [user.name] [user.email] [core.editor]" 
}

if [ "$#" -lt 1 ]; then
  usage
  byebye
fi

echo "Update git configurations..."

# Your Identity
if [ "$1" != "" ]; then
  git config --global user.name "$1"
fi
if [ "$2" != "" ]; then
  git config --global user.email "$2"
fi

# Your Editor
if [ "$3" != "" ]; then
  git config --global core.editor $3 
fi

# Checking Your Settings
echo ""
echo "Your current git config setting had been changed to:"
echo "[name]"
git config user.name
echo "[email]"
git config user.email
echo "[editor]"
git config core.editor
#git config --list

byebye
