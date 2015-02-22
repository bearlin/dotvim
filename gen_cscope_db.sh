#!/bin/bash

#echo "The script name is        ==> $0"
#echo "Total parameter number is ==> $#"

[ "$#" -lt 1 ] && \
    echo "Usage: " && \
    echo "Init cscope files: ./gen_cscope_db.sh init" && \
    echo "Clear cscope files: ./gen_cscope_db.sh clean" && \
    exit 0

#echo "Your whole parameter is   ==> '$@'"
#echo "The 1st parameter         ==> $1"
#echo "The 2nd parameter         ==> $2"

if [ "$1" == "init" ] || [ "$1" == "clean" ]; then
  echo "para=$1"
else
  echo "Unknow parameters \"$1\""
  exit 0
fi

if [ "$1" == "init" ]; then
  # References:
  # Cscope Will Change The Way You Code With Vim:
  # http://derekingrouville.com/2012/cscope-will-change-the-way-you-code/
  # vim附件：cscope+ctag 使用筆記
  # http://angledark0123.pixnet.net/blog/post/51919594-vim%E9%99%84%E4%BB%B6%EF%BC%9Acscope%2Bctag-%E4%BD%BF%E7%94%A8%E7%AD%86%E8%A8%98
  
  # 1. Build cscope.files
  echo "Build cscope.files"
  find `pwd` -name "*.c" -o -name "*.cc" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.cxx" > cscope.files
  find `pwd` -name "*.java" >> cscope.files
  find `pwd` -name "*.cmake" -o -name "*.sh" -o -name "CMakeLists.txt" >> cscope.files

  # 2. Build the database
  which cscope &>/dev/null
  [ $? -eq 0 ] || echo "cscope command not found, please install cscope first."

  echo "Build the database"
  # -R     Recurse subdirectories during search for source files.
  # -b     Build the cross-reference only.
  # -q     Enable fast symbol lookup via an inverted index.
  # -k     ``Kernel Mode'', turns off the use of the default include dir (usually /usr/include) when building the database, since kernel source trees generally do not use it.
  # -inamefile Browse  through all source files whose names are listed in namefile (file names separated by spaces, tabs, or new-lines) instead of the default name list file, which is called cscope.files.
  cscope -b -q -R -i cscope.files
  #cscope -b -q -k -i cscope.files

elif [ "$1" == "clean" ]; then
  echo "clean cscope files"
  rm cscope.*
fi

