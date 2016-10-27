#!/bin/bash

echo "### Running $0 ###"

RESULT_PREFIX="h_hpp_paths_"
LISTNAME_H="h-list"
LISTNAME_HPP="hpp-list"
LISTNAME_MERGED="h+hpp-list"
DOT_OUT=".out"
DOT_DIRNAME=".dirname"
DBG_DIRNAME=".dirname.dbg"
DOT_UNIQUE=".unique"

FILE_H_LIST=$RESULT_PREFIX$LISTNAME_H$DOT_OUT
FILE_HPP_LIST=$RESULT_PREFIX$LISTNAME_HPP$DOT_OUT
FILE_H_HPP_LIST=$RESULT_PREFIX$LISTNAME_MERGED$DOT_OUT
FILE_DIRNAME=$FILE_H_HPP_LIST$DOT_DIRNAME
FILE_DIRNAME_DBG=$FILE_H_HPP_LIST$DBG_DIRNAME
FILE_UNIQUE=$FILE_H_HPP_LIST$DOT_UNIQUE

echo "This script will try to get all C/C++ headers' path(s) under ./, this will be very usefull for YouCompleteMe's .ycm_extra_conf.py file"
echo "The path list output is ./get_all_h_hpp_paths.out"

echo "Collect file lists of all *.h and *.hpp..."
find . -name "*\.h" -type f > $FILE_H_LIST
find . -name "*\.hpp" -type f > $FILE_HPP_LIST

echo "Merge file lists..."
cp $FILE_H_LIST $FILE_H_HPP_LIST
cat $FILE_HPP_LIST >> $FILE_H_HPP_LIST

echo "Get directory path(s) by stripping filenames from full path(s)..."
ln=0
# http://www.cyberciti.biz/faq/unix-howto-read-line-by-line-from-file/
while IFS= read -r line
do
  ln=$((ln+1))
  if ! ((ln % 50)); then
    echo "[$ln] $line"
  fi
  echo "$line" >> $FILE_DIRNAME_DBG
  dirname "$line" >> $FILE_DIRNAME
done < "$FILE_H_HPP_LIST"

echo "Sort the path(s) to unique result..."
sort -u $FILE_DIRNAME > $FILE_UNIQUE

echo "Clean temp files 1..."
rm $FILE_H_LIST
rm $FILE_HPP_LIST
rm $FILE_H_HPP_LIST
rm $FILE_DIRNAME
# rm $DBG_DIRNAME

echo "Convert path to .ycm_extra_conf.py format (conver to '-I{PATH}',)..."
cp $FILE_UNIQUE $FILE_UNIQUE.before
# In sed, use '\'' to end up with a single quote in the regex
sed -i'.sed1.bak' 's/^\./'\''-I\./g' $FILE_UNIQUE
sed -i'.sed2.bak' 's/$/'\'',/g' $FILE_UNIQUE

mv $FILE_UNIQUE $FILE_UNIQUE.after

echo "Clean temp files 2..."
rm *.bak

echo "Now you can copy the content of '$FILE_UNIQUE.after' to the flags[] array
of your .ycm_extra_conf.py file..."
