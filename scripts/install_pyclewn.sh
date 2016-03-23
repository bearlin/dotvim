#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Reference: 
# https://zschoche.org/debugging-in-vim/
# http://pyclewn.sourceforge.net/install.html#installing-from-source
# https://pypi.python.org/pypi/pyclewn

cd "$DOTVIMHOME" 
# ------------------------ 

hasWget=0
hasCurl=0
setFlagsHasWgetHasCurlAndExitIfBothEqualZero "$@"
echo "hasWget=$hasWget"
echo "hasCurl=$hasCurl"

if [ -d "$DOTVIMHOME/.tmp" ]; then
  rm -rf $DOTVIMHOME/.tmp/*
  echo "rm -rf $DOTVIMHOME/.tmp/*"
else
  mkdir -p $DOTVIMHOME/.tmp
  echo "mkdir -p $DOTVIMHOME/.tmp"
fi

cd "$DOTVIMHOME/.tmp"

# Get pyclewn-2.2.tar.gz, pdb-clone-1.10.tar.gz and trollius-2.1.tar.gz
if [ $hasWget == 1  ]; then
  wget "https://pypi.python.org/packages/source/p/pyclewn/pyclewn-2.2.tar.gz" -O "pyclewn-2.2.tar.gz"
  wget "https://pypi.python.org/packages/source/p/pdb-clone/pdb-clone-1.10.tar.gz" -O "pdb-clone-1.10.tar.gz"
  wget "https://pypi.python.org/packages/source/t/trollius/trollius-2.1.tar.gz" -O "trollius-2.1.tar.gz"
elif [ $hasCurl == 1  ]; then
  curl -LSo "pyclewn-2.2.tar.gz" "https://pypi.python.org/packages/source/p/pyclewn/pyclewn-2.2.tar.gz"
  curl -LSo "pdb-clone-1.10.tar.gz" "https://pypi.python.org/packages/source/p/pdb-clone/pdb-clone-1.10.tar.gz"
  curl -LSo "trollius-2.1.tar.gz" "https://pypi.python.org/packages/source/t/trollius/trollius-2.1.tar.gz"
else
  die "Unknow parameters, exit"
fi

# http://pyclewn.sourceforge.net/install.html#installing-from-source
# Check commands
which python &>/dev/null
if [ $? -ne 0 ]; then
  die "missing python tool, exit"
fi
which tar &>/dev/null
if [ $? -ne 0 ]; then
  die "missing tar tool, exit"
fi
# Extract pdb-clone-1.10
#tar xzf pdb-clone-1.10.tar.gz
#if [ $? -ne 0 ]; then
  #die "extract pyclewn error, exit"
#fi
# Extract trollius-2.1.tar.gz
#tar xzf trollius-2.1.tar.gz
#if [ $? -ne 0 ]; then
  #die "extract pyclewn error, exit"
#fi
# Extract pyclewn-2.2
tar xzf pyclewn-2.2.tar.gz
if [ $? -ne 0 ]; then
  die "extract pyclewn error, exit"
fi

# Install pdb-clone-1.10
#cd pdb-clone-1.10
#if [ $? -ne 0 ]; then
  #die "can't change to pyclewn-2.2 directory, exit"
#fi
#sudo python setup.py install
#cd ..
#cd trollius-2.1
#if [ $? -ne 0 ]; then
  #die "can't change to pyclewn-2.2 directory, exit"
#fi
#sudo python setup.py install
#cd ..
# Install pyclewn-2.2
cd pyclewn-2.2
if [ $? -ne 0 ]; then
  die "can't change to pyclewn-2.2 directory, exit"
fi
#sudo python setup.py install
#sudo vimdir=$HOME/.vim python setup.py install #--home=$HOME
export EDITOR=/usr/local/bin/vim
#sudo vimdir=$HOME/.vim python setup.py install --force
sudo vimdir=$HOME/.vim python setup.py install --home=$HOME
cd ..

sudo rm -rf $DOTVIMHOME/.tmp

# ------------------------ 
cd -
byebye "$@"
