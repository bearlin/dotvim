# dotvim
This is my vim/gvim setting repo.  

# For how I managed my plugins, please check below link
Synchronizing plugins with git submodules and pathogen  
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/  

# Very useful site to learn vim and plugins
http://vimcasts.org/

# Plugins manager: pathogen.vim
http://www.vim.org/scripts/script.php?script_id=2332  
https://github.com/tpope/vim-pathogen  

# Plugins path(all managed by pathogen)
bundle/*  

# Plugins pre-downloaded
autocomplpop http://www.vim.org/scripts/script.php?script_id=1879  
autoload_cscope http://vim.sourceforge.net/scripts/script.php?script_id=157  
cscope_maps.vim http://cscope.sourceforge.net/cscope_vim_tutorial.html  

# Plugins need to be "git submodule init/update"
supertab http://www.vim.org/scripts/script.php?script_id=1643  
ctrlp.vim http://www.vim.org/scripts/script.php?script_id=3736  
nerdtree http://www.vim.org/scripts/script.php?script_id=1658  
taglist http://www.vim.org/scripts/script.php?script_id=273  
srcexpl http://www.vim.org/scripts/script.php?script_id=2179  
trinity http://www.vim.org/scripts/script.php?script_id=2347  
fugitive http://www.vim.org/scripts/script.php?script_id=2975  
surround http://www.vim.org/scripts/script.php?script_id=1697  

# Color colorschemes
wombat http://www.vim.org/scripts/script.php?script_id=1778  
apprentice http://www.vim.org/scripts/script.php?script_id=4905  
grb256 https://github.com/garybernhardt/dotfiles/blob/master/.vim/colors/grb256.vim  
jellybeans https://github.com/nanotech/jellybeans.vim  
Change colorscheme at runtime -> :colorscheme [apprentice|wombat|grb256|jellybeans]  

# Before install:
If you are using MacOS, I suggest you use package manager Homebrew to install exuberant-ctags and cscope to support multiple languages(The default ctags version on Mac OS is not the exuberant one). Also install wget or curl for scripts updating.  

# Auto install steps:  
Reference from vgod's vim install steps.  
Use curl (for Mac OS X):  
```sh
  curl -o - https://github.com/bearlin/dotvim/blob/master/auto_install.sh | sh
```
Or use wget (for most UNIX platforms):  
```sh
  wget -O - https://github.com/bearlin/dotvim/blob/master/auto_install.sh | sh
```

# Manually install steps:  
```sh
sudo apt-get install vim exuberant-ctags cscope wget curl 
git clone https://github.com/bearlin/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

cd ~/.vim
git submodule init
git submodule update
./scripts/update_pre_downloaded_plugins.sh
./scripts/cscope_maps_patch.sh

./scripts/set_env_git.sh    (Optional)
```

# Some useful scripts
```sh
scripts/update_pre_downloaded_plugins.sh:  
  Update cscope_maps and autoload_cscope .vim files.  

scripts/gen_cscope_db.sh:  
  Generate cscope files/database in `pwd`.  

scripts/gen_ctags_db.sh:  
  Generate ctags database in `pwd`.  

scripts/cscope_maps_patch.sh:  
  Do some patch to cscope_maps.vim. I would like to use F7 key to trigger cscope key mapping.  

scripts/cscope_maps_unpatch.sh:  
  Undo the patch to cscope_maps.vim.   
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

# Remove old vim plugin from git submodule:
For example, to remove colorscheme submodule "bundle/apprentice":  
1. Go to ~/.vim/ directory:
```sh
cd ~/.vim/
```
2. Delete the relevant section from the .gitmodules file.  The section would look similar to:  
```sh
[submodule "bundle/apprentice"]
  path = bundle/apprentice
  url = https://github.com/romainl/Apprentice.git
```
3. Stage the .gitmodules changes via command line using:  
```sh
git add .gitmodules
```
4. Delete the relevant section from .git/config, which will look like:  
```sh
[submodule "bundle/apprentice"]
  url = https://github.com/romainl/Apprentice.git
```
5. Run git rm --cached path/to/submodule .  Don't include a trailing slash -- that will lead to an error.  
```sh
git rm --cached bundle/apprentice
```
6. Run rm -rf .git/modules/submodule_path  
```sh
rm -rf .git/modules/bundle/apprentice
```
7. Commit the change:  
```sh
git commit -m "Removed submodule bundle/apprentice"
```
8. Delete the now untracked submodule files rm -rf path/to/submodule  
```sh
rm -rf bundle/apprentice
```

# References:  
  https://github.com/vgod/vimrc
  http://blog.vgod.tw/2011/03/19/vimrc/?variant=zh-tw  
  http://blog.roga.tw/2010/01/%E6%88%91%E7%9B%AE%E5%89%8D%E4%BD%BF%E7%94%A8%E7%9A%84-vimrc-%E8%A8%AD%E5%AE%9A%E6%AA%94/  
  http://stenlyho.blogspot.tw/2010/03/vim-trinity-source-explorer-tag-list.html
  http://yuanfarn.blogspot.tw/2013/02/srcexpl-vim-source-explorer.html
  http://eeepage.info/tag-vim-source-insight/
  http://www.cnblogs.com/coderkian/p/3823366.html
  http://blog.longwin.com.tw/2013/03/favorite-vim-vimrc-setup-2013/
  http://technosavvy-vdk.blogspot.in/2012/01/ctags-and-cscope-for-java.html 
  http://davidwalsh.name/git-remove-submodule  
  http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule  
  
