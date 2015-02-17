# vimrc
This is my vimrc repo.  

#Plugin Manager 
Synchronizing plugins with git submodules and pathogen  
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

pathogen.vim : Poor man's package manager. Easy manipulation of 'runtimepath' et al  
http://www.vim.org/scripts/script.php?script_id=2332

#Plugins
taglist.vim : Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)  
http://www.vim.org/scripts/script.php?script_id=273

The NERD tree : A tree explorer plugin for navigating the filesystem  
http://www.vim.org/scripts/script.php?script_id=1658

Source Explorer (SrcExpl) : The Source Explorer can work with 'Taglist' and 'NERD tree' very well. Both of them make (G)Vim looks like the "Source Insight" in Unix/Windows/Mac enviroment  
http://www.vim.org/scripts/script.php?script_id=2179

Trinity : The Trinity plugin manages Source Explorer, Taglist and NERD Tree, and build them as a great IDE which works like the "Source Insignt". 
http://www.vim.org/scripts/script.php?script_id=2347

#vimrc tool
sachet:  
http://yoursachet.com/  

# Install steps:  
```sh
sudo apt-get install vim exuberant-ctags cscope  
git clone https://github.com/bearlin/vimrc.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
```

For the steps how I create this repo please check "how-to.txt".  

References:  
  http://blog.vgod.tw/2011/03/19/vimrc/?variant=zh-tw  
  http://blog.roga.tw/2010/01/%E6%88%91%E7%9B%AE%E5%89%8D%E4%BD%BF%E7%94%A8%E7%9A%84-vimrc-%E8%A8%AD%E5%AE%9A%E6%AA%94/  
  http://stenlyho.blogspot.tw/2010/03/vim-trinity-source-explorer-tag-list.html
  http://yuanfarn.blogspot.tw/2013/02/srcexpl-vim-source-explorer.html
  http://eeepage.info/tag-vim-source-insight/
  http://www.cnblogs.com/coderkian/p/3823366.html
  http://blog.longwin.com.tw/2013/03/favorite-vim-vimrc-setup-2013/