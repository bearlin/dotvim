# dotvim
This is my vim/gvim setting repo.  

# Plugins manager: vim-plug
https://github.com/junegunn/vim-plug

# Plugins path(all managed by vim-plug)
plugged/*  

# Plugins pre-downloaded
[cscope_maps.vim](http://cscope.sourceforge.net/cscope_vim_tutorial.html)  

# Plugins need to be ":PlugInstall" using vim-plug 
[fugitive](http://www.vim.org/scripts/script.php?script_id=2975)  
[nerdtree](http://www.vim.org/scripts/script.php?script_id=1658)  
[srcexpl](http://www.vim.org/scripts/script.php?script_id=217)  
[taglist](http://www.vim.org/scripts/script.php?script_id=273)  
[vim-commentary](https://github.com/tpope/vim-commentary)
[DirDiff](http://www.vim.org/scripts/script.php?script_id=102)  
[ctrlp.vim](http://www.vim.org/scripts/script.php?script_id=373)  
[surround](http://www.vim.org/scripts/script.php?script_id=1697)  
[supertab](http://www.vim.org/scripts/script.php?script_id=1643)  
[vim-cpp-enhanced-highlight](http://www.vim.org/scripts/script.php?script_id=4617)  
[autoload_cscope](http://vim.sourceforge.net/scripts/script.php?script_id=157)  
[autocomplpop](http://www.vim.org/scripts/script.php?script_id=1879)  
[snipMate](https://github.com/garbas/vim-snipmate)  
Color colorschemes:  
[apprentice](http://www.vim.org/scripts/script.php?script_id=4905)  
[jellybeans](https://github.com/nanotech/jellybeans.vim)  
[solarized](http://ethanschoonover.com/solarized)  
Change colorscheme at runtime -> :colorscheme [apprentice|wombat|grb256|jellybeans]  

# Before install:
Install below packages:  
(Required) git, vim/macvim, exuberant-ctags, cscope, wget or curl, unzip  
(optional) GNU GLOBAL (gtags, global, gtags-cscope), cmake  

If you are using MacOS, I suggest you use package manager Homebrew to install exuberant-ctags and cscope to support multiple languages(The default ctags version on Mac OS is not the exuberant one). Also install wget or curl for scripts updating.  

# Building Vim from source
With Ubuntu, the apt-get will install older VIM version which may have some very strange behavior, I suggest you follow below link to build and install Vim from source  
[Building-Vim-from-source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)  
General steps:  
```
# install all the prerequisite libraries
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
    
# Remove vim if you have it already
sudo apt remove vim vim-runtime gvim

# Clone and make Vim
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim80

# Install Vim via checkinstall
sudo apt install checkinstall
cd ~/vim
sudo checkinstall

# Set vim as your default editor with update-alternatives
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim

# Verify install 
vim --version

# To uninstall Vim
cd ~/vim
sudo dpkg -r vim
```

# Auto install steps:  
Reference from [vgod's vim install steps](https://github.com/vgod/vimrc)  
Get auto_install_dotvim.sh use curl (for Mac OS X):  
```sh
  curl -LSo "auto_install_dotvim.sh" "https://raw.githubusercontent.com/bearlin/dotvim/master/auto_install_dotvim.sh"
```
Or use wget (for most UNIX platforms):  
```sh
  wget "https://raw.githubusercontent.com/bearlin/dotvim/master/auto_install_dotvim.sh" -O "auto_install_dotvim.sh" 
```
Then run below scripts to install both .vimrc and its plugins via vim-plug:  
```sh
  chmod +x auto_install_dotvim.sh
  ./auto_install_dotvim.sh
  vim +PlugInstall +qall
```
Or force remove ~/.vim, ~/.vimrc and ~/.gvimrc:  
```sh
  chmod +x auto_install_dotvim.sh
  ./auto_install_dotvim.sh force
  vim +PlugInstall +qall
```

# Manually install steps:  
```sh
(Ubuntu) sudo apt-get install git vim exuberant-ctags cscope cmake wget curl unzip 
(MacOS) brew install git ctags cscope global cmake wget curl
        # ---------IMPORTANT: make sure system using VIM from /usr/local/bin/Cellar/macvim/8.0-113/bin/mvim ---------
        #brew install macvim --with-cscope --with-override-system-vim --with-eython3
        brew install macvim
        brew link --overwrite macvim
        #------------------------------------------------------------------------------------------------------------

(rename or backup your ~/.vim, ~/.vimrc and ~/.gvimrc)
git clone https://github.com/bearlin/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

cd ~/.vim
./scripts/update_plugin_manager.sh
./scripts/update_pre_downloaded_plugins.sh
./scripts/cscope_maps_patch.sh
vim +PlugInstall +qall
```

# Some useful scripts
```sh
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

# (Abandoned. Only for Pathogen) Install new vim plugin as git submodule:
```sh
cd ~/.vim
git submodule add <github-plugin-clone-url> bundle/<plugin-name>
git status
git add -A
git commit -m "Install <plugin-name>"
git push
```

# (Abandoned. Only for Pathogen) Remove old vim plugin from git submodule:
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

# Very useful site to learn vim and plugins
[vimcasts.org](http://vimcasts.org/)  
[practical-vim](https://pragprog.com/book/dnvim/practical-vim)  
[use_vim_as_ide](https://github.com/yangyangwithgnu/use_vim_as_ide/blob/master/README.md)  
[Don’t tell people to use VIM (because) You’re Using It Wrong](http://antjanus.com/blog/thoughts-and-opinions/use-vim/)
[Coming Home to Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)
[Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/)

# References:  
  https://github.com/vgod/vimrc
  http://blog.vgod.tw/2011/03/19/vimrc/?variant=zh-tw  
  http://blog.roga.tw/2010/01/%E6%88%91%E7%9B%AE%E5%89%8D%E4%BD%BF%E7%94%A8%E7%9A%84-vimrc-%E8%A8%AD%E5%AE%9A%E6%AA%94/  
  http://yuanfarn.blogspot.tw/2013/02/srcexpl-vim-source-explorer.html
  http://eeepage.info/tag-vim-source-insight/
  http://www.cnblogs.com/coderkian/p/3823366.html
  http://blog.longwin.com.tw/2013/03/favorite-vim-vimrc-setup-2013/
  http://technosavvy-vdk.blogspot.in/2012/01/ctags-and-cscope-for-java.html 
  http://davidwalsh.name/git-remove-submodule  
  http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule  
  http://www.bestofvim.com/
  
