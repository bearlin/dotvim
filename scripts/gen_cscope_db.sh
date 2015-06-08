#!/bin/bash
# Limitations:
# 1. cscope: cannot find file: For symbolic linked files
# 2. cscope: cannot find file: For very long file path

DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

#echo "The script name is        ==> $0"
#echo "Total parameter number is ==> $#"

[ "$#" -lt 1 ] && \
  echo "Usage: " && \
  echo "Init cscope files: ./gen_cscope_db.sh init" && \
  echo "Init cscope files with tags in /usr/include: ./gen_cscope_db.sh init std" && \
  echo "Clear cscope files: ./gen_cscope_db.sh clean" && \
  byebye "$@"

#echo "Your whole parameter is   ==> '$@'"
#echo "The 1st parameter         ==> $1"
#echo "The 2nd parameter         ==> $2"

if [ "$1" == "init" ] || [ "$1" == "clean" ]; then
  if [ "$2" == "std" ]; then
    echo "para=$1 $2"
  else
    echo "para=$1"
  fi
else
  die "Unknow parameters \"$1\", exit!"
fi

if [ "$1" == "init" ]; then
  # References:
  # Cscope Will Change The Way You Code With Vim:
  # http://derekingrouville.com/2012/cscope-will-change-the-way-you-code/
  # vim附件：cscope+ctag 使用筆記
  # http://angledark0123.pixnet.net/blog/post/51919594-vim%E9%99%84%E4%BB%B6%EF%BC%9Acscope%2Bctag-%E4%BD%BF%E7%94%A8%E7%AD%86%E8%A8%98
  
  # 1. Build cscope.files
  echo "Build cscope.files..."
    # C/C++ files
    #  -name "*.c" -o -name "*.cc" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.cxx" -o -name "*.inl"\
    # Java files
    #  -o -name "*.java" \
    # Python files
    #  -o -name "*.py" \
    # Perl files
    #  -o -name "*.pl" \
    # OS Scripts 
    #  -o -name "*.sh" -o -name "*.bat" -o -name "*.cmd" \
    # Config files 
    #  -o -name "*.yaml" -o -name "*.xml" -o -name "*.json" -o -name "*.ini" \
    # Web files 
    #  -o -name "*.html" -o -name "*.php" -o -name "*.jsp"\
    # Build Scripts
    #  -o -name "*.cmake" -o -name "CMakeLists.txt" -o -name "*.in"\
    # QT files
    #  -o -name "*.ui" -o -name "*.qss" -o -name "*.qrc" -o -name "*.ts" \
    # TomTom files
    #  -o -name "*.ric" \
  #find `pwd`/AppLoaders/ `pwd`/Kits/ `pwd`/Platform/ `pwd`/Products/ \
  find `pwd` \
      -name "*.c" -o -name "*.cc" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.cxx" -o -name "*.inl"\
      -o -name "*.pl" \
      -o -name "*.sh" -o -name "*.bat" -o -name "*.cmd" \
      -o -name "*.yaml" -o -name "*.xml" -o -name "*.json" -o -name "*.ini" \
      -o -name "*.cmake" -o -name "CMakeLists.txt" -o -name "*.in"\
      -o -name "*.ric" \
  | sed -e 's/^/"/g' -e 's/$/"/g' \
  > cscope.files
# [NOTE]
# Issue: man cscope :Filenames in the namefile that contain whitespace have to be enclosed in "double quotes".  Inside such quoted filenames, any  double-quote and backslash characters have to be escaped by backslashes
# Solution: quote all file paths: http://stackoverflow.com/questions/3196760/how-to-use-cscope-with-paths-that-contain-spaces

  # 2. Build the database
  which cscope &>/dev/null
  [ $? -eq 0 ] || echo "cscope command not found, please install cscope first."

  echo "Build the database..."
  # -R     Recurse subdirectories during search for source files.
  # -b     Build the cross-reference only.
  # -q     Enable fast symbol lookup via an inverted index.
  # -k     ``Kernel Mode'', turns off the use of the default include dir (usually /usr/include) when building the database, since kernel source trees generally do not use it.
  # -inamefile Browse  through all source files whose names are listed in namefile (file names separated by spaces, tabs, or new-lines) instead of the default name list file, which is called cscope.files.
  # -sdir  Look  in  dir  for additional source files. This option is ignored if source files are given on the command line.
  if [ "$2" == "std" ]; then
    cscope -bq -i cscope.files # Include tags in /usr/include
    echo "WITH tags in std headers"
  else
    #cscope -bqkR -s .
    #cscope -bqR -i cscope.files
    #cscope -bqkR -i cscope.files
    cscope -bqk -i cscope.files
    echo "WITHOUT tags in std headers"
  fi
elif [ "$1" == "clean" ]; then
  echo "clean generated cscope files in current folder..."
  rm cscope.*
fi

byebye "$@"
