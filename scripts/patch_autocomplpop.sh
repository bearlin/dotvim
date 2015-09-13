#!/bin/bash
DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh

# Problem descriptions:
# http://vimawesome.com/plugin/autocomplpop
# http://liuyix.org/blog/2011/solve-collasion-between-snipmate-and-acp/
# https://www.ptt.cc/bbs/Editor/M.1264437741.A.4ED.html
# SnipMate是蘋果textMate編輯器的複製版，鍵入關鍵字再按tab會自動完成
# 最棒的是，這兩個plugin還可以整合！
# 轉貼google group c9s大的文：
# Cornelius
# 可參見 autocomplpop 的 help 文件，將
  # fun! GetSnipsInCurrentScope()
  #   let snips = {}
  #   for scope in [bufnr('%')] + split(&ft, '\.') + ['_']
  #     call extend(snips, get(s:snippets, scope, {}), 'keep')
  #     call extend(snips, get(s:multi_snips, scope, {}), 'keep')
  #   endfor
  #   return snips
  # endf
# 放入 plugin/snipMate.vim 內。
# 然後設定 g:acp_behaviorSnipmateLength 為 1
# 那麼開頭大寫的字母便會自動 trigger snipmate 的 completion。

# Do some patch to snipMate.vim
# Add new function "GetSnipsInCurrentScope()" to "snipMate.vim"
echo "Do some patching to snipMate.vim..."
echo "
  fun! GetSnipsInCurrentScope()
    let snips = {}
    for scope in [bufnr('%')] + split(&ft, '\.') + ['_']
      call extend(snips, get(s:snippets, scope, {}), 'keep')
      call extend(snips, get(s:multi_snips, scope, {}), 'keep')
    endfor
    return snips
  endf
" >> $DOTVIMHOME/bundle/vim-snipmate/plugin/snipMate.vim

byebye "$@"
