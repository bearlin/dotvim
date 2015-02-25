#!/bin/bash

#echo "The script name is        ==> $0"
#echo "Total parameter number is ==> $#"

[ "$#" -lt 1 ] && \
    echo "Usage: " && \
    echo "Init ctags files: ./gen_ctags_db.sh init" && \
    echo "Clear ctags files: ./gen_ctags_db.sh clean" && \
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
  # http://blog.chhsu.org/2009/03/multi-projects-of-vim-using-cscope.html
  # http://blog.chhsu.org/2010/06/vim-android-framework.html
  
  # 1. Build the database
  which ctags &>/dev/null
  [ $? -eq 0 ] || echo "ctags command not found, please install ctags first."

  echo "Build the database"
  # -R   Equivalent to --recurse.
  # --recurse[=yes|no] Recurse into directories encountered in the list of supplied files.
  # --sort[=yes|no|foldcase] Indicates  whether the tag file should be sorted on the tag name (default is yes). The foldcase value specifies case insensitive (or case-folded) sorting.
  #ctags --sort=foldcase -R .
  ctags --sort=foldcase -L cscope.files 

elif [ "$1" == "clean" ]; then
  echo "clean ctags files"
  rm tags
fi

echo "bye!"

