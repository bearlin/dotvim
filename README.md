# dotvim
This is my vim/gvim setting repo.  

# For how I managed my plugins, please check below link
Synchronizing plugins with git submodules and pathogen  
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/  

# Plugins manager: pathogen.vim
http://www.vim.org/scripts/script.php?script_id=2332  
https://github.com/tpope/vim-pathogen  

# Plugins path(all managed by pathogen)
bundle/*  

# Plugins pre-downloaded
autocomplpop http://www.vim.org/scripts/script.php?script_id=1879  
supertab http://www.vim.org/scripts/script.php?script_id=1643  
Wombat http://www.vim.org/scripts/script.php?script_id=1778  

# Plugins need to be "git submodule init/udate"
fugitive http://www.vim.org/scripts/script.php?script_id=2975  
nerdtree http://www.vim.org/scripts/script.php?script_id=1658  
srcexpl http://www.vim.org/scripts/script.php?script_id=2179  
taglist http://www.vim.org/scripts/script.php?script_id=273  
trinity http://www.vim.org/scripts/script.php?script_id=2347  
ctrlp.vim http://www.vim.org/scripts/script.php?script_id=3736  
vim-surround http://www.vim.org/scripts/script.php?script_id=1697  

# Install steps:  
```sh
sudo apt-get install vim exuberant-ctags cscope  
git clone https://github.com/bearlin/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

cd ~/.vim
git submodule init
git submodule update
```

# Auto-generate vimrc tool
sachet:  
http://yoursachet.com/  

# Install new vim plugin as git submodule:
```sh
cd ~/.vim
git submodule add <github-plugin-clone-url> bundle/<plugin-name>
git status
git add -A
git commit -m "Install <plugin-name>"
git push
```

# References:  
  http://blog.vgod.tw/2011/03/19/vimrc/?variant=zh-tw  
  http://blog.roga.tw/2010/01/%E6%88%91%E7%9B%AE%E5%89%8D%E4%BD%BF%E7%94%A8%E7%9A%84-vimrc-%E8%A8%AD%E5%AE%9A%E6%AA%94/  
  http://stenlyho.blogspot.tw/2010/03/vim-trinity-source-explorer-tag-list.html
  http://yuanfarn.blogspot.tw/2013/02/srcexpl-vim-source-explorer.html
  http://eeepage.info/tag-vim-source-insight/
  http://www.cnblogs.com/coderkian/p/3823366.html
  http://blog.longwin.com.tw/2013/03/favorite-vim-vimrc-setup-2013/