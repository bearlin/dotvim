#!/bin/bash

DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

usage() {
  echo "Usage: " && \
  echo "Init gtags files: ./gen_gtags_db.sh init" && \
  echo "Update gtags files: ./gen_gtags_db.sh update" && \
  echo "Clear gtags files: ./gen_gtags_db.sh clean" && \
  echo "Generate html files: ./gen_gtags_db.sh html"
}

if [ "$#" -lt 1 ]; then
  usage
  byebye "$@"
fi

if [ "$1" == "init" ] || 
   [ "$1" == "update" ] || 
   [ "$1" == "clean" ] || 
   [ "$1" == "html" ]; then
  echo "para=$1"
else
  die "Unknow parameters \"$1\", exit!"
fi

hasGtags=0
setFlagsHasGtagsAndExitIfEqualZero "$@"
echo "hasGtags=$hasGtags"

if [ "$1" == "clean" ]; then
  echo "clean generated gtags files in current folder..."
  rm GPATH GRTAGS GTAGS
elif [ "$1" == "init" ]; then
  # References:
  # 在 Vim 中使用 Gtags 进行代码导航 : http://blog.wittyfox.me/p/use-gtags-for-source-code-navigation-in-vim/
  # brew install global : http://brewformulas.org/Global
  # https://github.com/bearlin/study_build_gnu_global_from_source
  # --skip-unreadable : Skip unreadable files.
  # --statistics      : Print statistics information.
  echo "Build the database with (gtags --skip-unreadable --statistics)..."
  gtags --skip-unreadable --statistics
elif [ "$1" == "update" ]; then
  echo "Update the database with (global -u)..."
  global -u
elif [ "$1" == "html" ]; then
  echo "Generate a hypertext from a set of source files with (htags --suggest)..."
  hasHtags=0
  setFlagsHasHtagsAndExitIfEqualZero "$@"
  echo "hasHtags=$hasHtags"
  echo ""
  echo "Htags generates a hypertext from a set of source files of C, C++, Yacc,
  Java, PHP and Assembly. In  advance  of  using  this  command, you should
  execute gtags(1) in the root directory of a source project.  Then you can
  execute htags in the same place.  Htags makes a directory named ´HTML´, and
  puts a hypertext in it.  You can start browsing at ´HTML/index.html´. Since
  htags generates a static hypertext as long as the -D or -f option is not
  specified, you can move it anywhere and browse it by any browser without any
  HTTP server. This command has so many options.  If you are new to htags, it
  is recommended to use the --suggest option.  With that option, htags chooses
  popular options on your behalf."

  htags --suggest
else
  usage
  byebye "$@"
fi

byebye "$@"
