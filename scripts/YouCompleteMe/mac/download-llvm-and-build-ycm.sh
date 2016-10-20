#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh
cd "$DOTVIMHOME"
DOTVIMHOME_ABS=`pwd`

YOUCOMPLETEME_ROOT=$DOTVIMHOME_ABS/bundle/YouCompleteMe
YOUCOMPLETEME_TEMP_ROOT=$YOUCOMPLETEME_ROOT/tmp
YOUCOMPLETEME_BUILD_OUTPUT_ROOT=$YOUCOMPLETEME_TEMP_ROOT/build
YOUCOMPLETEME_PREBUILT_LLVM_CLANG_ROOT=$YOUCOMPLETEME_TEMP_ROOT/llvmclang

# Reference:
# http://valloric.github.io/YouCompleteMe/#full-installation-guide
# https://github.com/Valloric/YouCompleteMe
# http://blog.jobbole.com/58978/
# http://zuyunfei.com/2013/05/16/killer-plugin-of-vim-youcompleteme/
# https://github.com/Valloric/ycmd/blob/master/cpp/ycm/.ycm_extra_conf.py

# Check commands
# ------------------------
which python &>/dev/null
if [ $? -ne 0 ]; then
  die "missing python tool, exit"
fi
which tar &>/dev/null
if [ $? -ne 0 ]; then
  die "missing tar tool, exit"
fi
which cmake &>/dev/null
if [ $? -ne 0 ]; then
  die "missing cmake tool, exit"
fi

hasWget=0
hasCurl=0
setFlagsHasWgetHasCurlAndExitIfBothEqualZero "$@"
echo "hasWget=$hasWget"
echo "hasCurl=$hasCurl"

# Prepare directories
# ------------------------
if [ -d "$YOUCOMPLETEME_TEMP_ROOT" ]; then
  rm -rf $YOUCOMPLETEME_TEMP_ROOT/*
  echo "rm -rf $YOUCOMPLETEME_TEMP_ROOT/*"
else
  mkdir -p $YOUCOMPLETEME_TEMP_ROOT
  echo "mkdir -p $YOUCOMPLETEME_TEMP_ROOT"
fi
mkdir -p $YOUCOMPLETEME_BUILD_OUTPUT_ROOT
mkdir -p $YOUCOMPLETEME_PREBUILT_LLVM_CLANG_ROOT

# Get and extract clang+llvm-3.9.0-x86_64-apple-darwin.tar.xz
# ------------------------
cd "$YOUCOMPLETEME_PREBUILT_LLVM_CLANG_ROOT"
if [ $hasWget == 1  ]; then
  wget "http://llvm.org/releases/3.9.0/clang+llvm-3.9.0-x86_64-apple-darwin.tar.xz" -O "clang+llvm-3.9.0-x86_64-apple-darwin.tar.xz"
elif [ $hasCurl == 1  ]; then
  curl -LSo "clang+llvm-3.9.0-x86_64-apple-darwin.tar.xz" "http://llvm.org/releases/3.9.0/clang+llvm-3.9.0-x86_64-apple-darwin.tar.xz"
else
  die "Unknow parameters, exit"
fi
echo "@@@ Execute: tar Jxvf clang+llvm-3.9.0-x86_64-apple-darwin.tar.xz --strip-components=1"
tar Jxvf clang+llvm-3.9.0-x86_64-apple-darwin.tar.xz --strip-components=1
if [ $? -ne 0 ]; then
  die "extract clang+llvm error, exit"
fi
rm clang+llvm-3.9.0-x86_64-apple-darwin.tar.xz

# Compile the ycm_core library that YCM needs
# ------------------------
cd "$YOUCOMPLETEME_BUILD_OUTPUT_ROOT" # goto build/ folder
echo "@@@ Execute: cmake -G \"Unix Makefiles\" -DPATH_TO_LLVM_ROOT=$YOUCOMPLETEME_PREBUILT_LLVM_CLANG_ROOT . $YOUCOMPLETEME_ROOT/third_party/ycmd/cpp"
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=$YOUCOMPLETEME_PREBUILT_LLVM_CLANG_ROOT . $YOUCOMPLETEME_ROOT/third_party/ycmd/cpp
echo "@@@ Execute: cmake --build . --target ycm_core --config Release"
cmake --build . --target ycm_core --config Release

# Get configuration template to tmp folder
# ------------------------
cd "$YOUCOMPLETEME_TEMP_ROOT"
if [ $hasWget == 1  ]; then
  wget "https://raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py" -O ".ycm_extra_conf.py"
elif [ $hasCurl == 1  ]; then
  curl -LSo ".ycm_extra_conf.py" "https://raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py"
else
  die "Unknow parameters, exit"
fi
echo "YCM configuration template file was downloaded to $YOUCOMPLETEME_TEMP_ROOT/.ycm_extra_conf.py"

# ------------------------
cd -
byebye "$@"
