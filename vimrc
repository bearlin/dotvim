" ==============================================================================
" bearlin's vimrc
" Email : <bear.lin.001@gmail.com>
" Repo : https://github.com/bearlin/dotvim
" More info : https://github.com/bearlin/dotvim/blob/master/README.md
" ==============================================================================

" Vundle Vim plugin manage
" ==============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
" ----------------------------------
" Basic
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'wesleyche/SrcExpl'
Plugin 'tpope/vim-commentary'
Plugin 'will133/vim-dirdiff'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'

" Syntax highlight - C++
Plugin 'octol/vim-cpp-enhanced-highlight'

" Colorschemes
Plugin 'romainl/Apprentice'
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tejr/sahara'

" Auto completion
Plugin 'othree/vim-autocomplpop'
Plugin 'Rip-Rip/clang_complete'

" Snipmate from github.com/garbas/vim-snipmate
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Powerline
" Plugin 'Lokaltog/vim-powerline'
" Plugin 'Lokaltog/powerline'
Plugin 'powerline/powerline'
" [Note]
" Althought my vim changes to vim-airline, my tmux/bash still need powerline binding scripts 
" in ~/.vim/bundle/powerline/powerline/bindings/*, so still need to install powerline plugin here.

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Python plugings
"https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
Plugin 'vim-scripts/indentpython.vim'
" ----------------------------------

" plugin from http://vim-scripts.org/vim/scripts.html
" ----------------------------------
Plugin 'L9'
Plugin 'taglist.vim'
" ----------------------------------

" vim-easymotion
" ----------------------------------
Plugin 'easymotion/vim-easymotion'
" ----------------------------------

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
"
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
"
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" Install Plugins:
" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall

" References:
" http://easwy.com/blog/archives/advanced-vim-skills-filetype-on/
" https://github.com/VundleVim/Vundle.Vim
" http://lepture.com/en/2012/vundle-vs-pathogen
" http://mvnllife.blogspot.tw/2013/11/vim-to-ide1-vundlesnipmateautocomplpop.html
" http://blog.chh.tw/posts/vim-vundle/
" ==============================================================================

" ************************************
" ********* General Settings *********
" ************************************
" ====================================
" Basic settings
" -----------------------------------
" http://blog.roga.tw/2010/01/%E6%88%91%E7%9B%AE%E5%89%8D%E4%BD%BF%E7%94%A8%E7%9A%84-vimrc-%E8%A8%AD%E5%AE%9A%E6%AA%94/
" http://www.cnblogs.com/soli/archive/2008/03/17/1109931.html
 " Encoding settings
 set encoding=utf-8
 set fileencodings=utf-8,cp950,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
 set termencoding=utf-8
 " Editing settings
 syntax on         " This command switches on syntax highlighting, let Vim to overrule your settings with the defaults
 set nocompatible  " Make VIM not vi-compatible

  " Default indentation/fileformat settings
  " ----------------
  set tabstop=2     " Number of spaces that a <Tab> in the file counts for
  set softtabstop=2 " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
  set shiftwidth=2  " Number of spaces to use for each step of (auto)indent
  set textwidth=79  " Maximum width of text that is being inserted. A longer line will be broken after white space to get this width.
  set formatoptions=tcroq " Auto-wrap text using textwidth
  set expandtab     " In Insert mode: Use the appropriate number of spaces to insert a <Tab>
  set autoindent    " Copy indent from current line when starting a new line
  set fileformat=unix
  " ----------------
  " C/C++ indentation/fileformat settings
  " ----------------
  au BufNewFile,BufRead *.c *.h *.cpp *.cxx *.cc *.hpp *.inl
  \ setlocal
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2
  \ textwidth=79
  \ expandtab
  \ autoindent
  \ fileformat=unix
  " ----------------
  " Python indentation/fileformat settings
  " ----------------
  " https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
  au BufNewFile,BufRead *.py
  \ setlocal
  \ tabstop=4
  \ softtabstop=4
  \ shiftwidth=4
  \ textwidth=79
  \ expandtab
  \ autoindent
  \ fileformat=unix
  " ----------------
  " JavaScript/HTML/CSS indentation settings
  " ----------------
  " https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
  au BufNewFile,BufRead *.js, *.html, *.css
  \ setlocal
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2
  " ----------------
 " set noexpandtab
 set ruler         " Show the line and column number of the cursor position, separated by a comma
 set backspace=2   " Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode. 在 insert 也可用 backspace
 set ignorecase    " Ignore case in search patterns
 set hlsearch      " When there is a previous search pattern, highlight all its matches
 set incsearch     " While typing a search command, show where the pattern, as it was typed so far, matches
 set smartindent   " Do smart autoindenting when starting a new line
 set confirm       " When unsaved changes to a buffer, e.g. ":q" and ":e", raise a |dialog| asking if you wish to save the current file(s)
 set history=200   " A history of ":" commands, and a history of previous search patterns, how many will be remembered
 set cursorline    " Highlight the screen line of the cursor with CursorLine
 set laststatus=2  " The value of this option influences when the last window will have a status line: 0:never 1:if there are 2 windows 2:always
" set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]

" zsh Command-line completion style
 set wildmenu      " When 'wildmenu' is on, command-line completion operates in an enhanced mode
 set wildmode=full
" bash Command-line completion style
 " set wildmode=longest,list

" -----------------------------------

" Enable mouse and line numbering
" -----------------------------------
" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
" http://usevim.com/2012/05/16/mouse/
" http://vimdoc.sourceforge.net/htmldoc/options.html#'mouse' 
" How to copy text when mouse=a: http://stackoverflow.com/questions/4608161/copy-text-out-of-vim-with-set-mouse-a-enabled
 set number        " Print the line number in front of each line
" set ttyfast       " Indicates a fast terminal connection, More characters will be sent to the screen for redrawing

 set mouse=a       " Enable the use of the mouse in all modes
" set mouse=n       " Enable the use of the mouse only in normal modes

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
" set ttymouse=xterm " Name of the terminal type for which mouse codes are to be recognized. Currently use xterm-like mouse handling
" -----------------------------------

" Change mapleader to ','
" -----------------------------------
" Learn Vimscript the Hard Way - Leaders http://learnvimscriptthehardway.stevelosh.com/chapters/06.html
" http://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file
" https://github.com/yangyangwithgnu/use_vim_as_ide/blob/master/README.md
" http://stackoverflow.com/questions/11122866/vim-default-leader-key-on-a-macbook
 let mapleader=","
" -----------------------------------

" Easier split window navigations 
" -----------------------------------
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
"
" Easier split navigations 
" We can use different key mappings for easy navigation between splits to save a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
" About nmap and nnoremap: http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
 nnoremap <C-J> <C-W><C-J>
 nnoremap <C-K> <C-W><C-K>
 nnoremap <C-L> <C-W><C-L>
 nnoremap <C-H> <C-W><C-H>

" More natural split opening
" Open new split panes to right and bottom, which feels more natural than Vim’s default:
 set splitbelow       " When on, splitting a window will put the new window below the current one
 set splitright       " When on, splitting a window will put the new window right of the current one
" -----------------------------------

" Show special characters
" -----------------------------------
" http://danawoodman.com/posts/vim-show-whitespace/
" http://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-characters
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"
" Show extra whitespace
" 'list' : List mode: Show tabs as CTRL-I is displayed, display $ after end of line
" 'listchars' 'lcs' : Strings to use in 'list' mode and for the |:list| command.  It is a comma separated list of string settings
 set list
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" set listchars=eol:$,tab:\|_,trail:.,extends:>,precedes:<
 set listchars=eol:↲,tab:▸\ ,trail:·,extends:»,precedes:«
" set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<  " For Cygwin
" -----------------------------------

" Easier Cut/Copy/Paste 
" -----------------------------------
" http://serverfault.com/questions/27917/configure-vim-for-text-selection-with-shift-and-copy-paste-via-ctrlc-ctrlv
" http://vim.cybermirror.org/runtime/mswin.vim
" About vmap and vnoremap: http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
"
" <Leader>x are Cut in visual mode
" vnoremap <S-X>  "+x
 vnoremap <Leader>x "+x

" <Leader>y are Copy in visual mode
" vnoremap <S-C>  "+y
 vnoremap <Leader>y "+y

" <Leader>p are Paste in normal mode and command line mode
" noremap <S-V>   "+gp
" cnoremap <S-V>  <C-R>+
 nnoremap <Leader>p "+p
 cnoremap <Leader>p <C-R>+
" -----------------------------------

" Statusline and background color
" -----------------------------------
" sachet.com
" 'statusline' 'stl' : When nonempty, this option determines the content of the status line
" 'background' 'bg' : When set to "dark", Vim will try to use colors that look good on a dark background
"                     When set to "light", Vim will try to use colors that look good on a light background
"                     Any other value is illegal
 set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
" set background=light
 set background=dark
" -----------------------------------

" Color schemes
" -----------------------------------
" http://www.vimninjas.com/2012/08/26/10-vim-color-schemes-you-need-to-own/
" :colo[rscheme] {name} : Load color scheme {name}
" colorscheme sahara
" colorscheme apprentice
" colorscheme solarized
" colorscheme wombat
" colorscheme grb256
" colorscheme jellybeans
" -----------------------------------

" Hex editing using xxd tool
" -----------------------------------
" http://nion.modprobe.de/blog/archives/628-vim-as-hex-editor.html
 noremap <Leader>hon :%!xxd<CR>
 noremap <Leader>hof :%!xxd -r<CR>

" Considering adding advanced hex editing plugins in the future:
" http://usevim.com/2012/06/20/vim-binary-files/
" http://vim.wikia.com/wiki/Hex_dump
" http://vim.wikia.com/wiki/Improved_hex_editing
" http://www.vim.org/scripts/script.php?script_id=666
" https://github.com/fidian/hexmode
" -----------------------------------

" Insert current file/directory name/path
" -----------------------------------
" http://vim.wikia.com/wiki/Get_the_name_of_the_current_file
" http://vim.wikia.com/wiki/VimTip193
"
" To insert the current directory name of current file:
:inoremap <Leader>dnt <C-R>=expand("%:p:h:t")<CR>
" Inserts the current filename with the extension
:inoremap <Leader>fnt <C-R>=expand("%:t")<CR>
" Inserts the current filename without the extension
:inoremap <Leader>fne <C-R>=expand("%:t:r")<CR>

" To insert the relative file path of current file:
:inoremap <Leader>fnr <C-R>=expand("%")<CR>
" To insert the absolute file path of current file:
:inoremap <Leader>fna <C-R>=expand("%:p")<CR>
" To insert the relative directory path of current file:
:inoremap <Leader>dnr <C-R>=expand("%:h")<CR>
" To insert the absolute directory path of current file:
:inoremap <Leader>dna <C-R>=expand("%:p:h")<CR>
" -----------------------------------

" Buffers operations
" -----------------------------------
" http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" This allows buffers to be hidden if you've modified a buffer. This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer. This replaces :tabnew which I used to bind to this mapping
nmap <leader>B :enew<CR>
" Move to the next buffer
nmap <leader>bn :bnext<CR>
" Move to the previous buffer
nmap <leader>bp :bprevious<CR>
" Close the current buffer and move to the previous one. This replicates the idea of closing a tab
nmap <leader>bq :bprevious <BAR> bdelete #<CR>
" Show all open buffers and their status
nmap <leader>bl :buffers<CR>
" -----------------------------------

" Useful mappings for managing tabs
" -----------------------------------
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" -----------------------------------

" Treat long lines as break lines (useful when moving around in them)
" -----------------------------------
map j gj
map k gk
" -----------------------------------

" ************************************
" ****** Plugins settings start ******
" ************************************
" Source Explorer
" ==============================================================================
" // The switch of the Source Explorer                                         " 
 nmap <F10> :SrcExplToggle<CR> 
"                                                                              " 
" // Set the height of Source Explorer window                                  " 
 let g:SrcExpl_winHeight = 8 
"                                                                              " 
" // Set 100 ms for refreshing the Source Explorer                             " 
 let g:SrcExpl_refreshTime = 100 
"                                                                              " 
" // Set "Enter" key to jump into the exact definition context                 " 
 let g:SrcExpl_jumpKey = "<ENTER>" 
"                                                                              " 
" // Set "Space" key for back from the definition context                      " 
 let g:SrcExpl_gobackKey = "<SPACE>" 
"                                                                              " 
" // In order to avoid conflicts, the Source Explorer should know what plugins " 
" // except itself are using buffers. And you need add their buffer names into " 
" // below listaccording to the command ":buffers!"                            " 
 let g:SrcExpl_pluginList = [ 
         \ "__Tag_List__", 
         \ "_NERD_tree_" 
     \ ] 
"                                                                              " 
" // Enable/Disable the local definition searching, and note that this is not  " 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. " 
" // It only searches for a match with the keyword according to command 'gd'   " 
 let g:SrcExpl_searchLocalDef = 1 
"                                                                              " 
" // Do not let the Source Explorer update the tags file when opening          " 
 let g:SrcExpl_isUpdateTags = 0 
"                                                                              " 
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to " 
" //  create/update a tags file                                                " 
 let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
"                                                                              " 
" // Set "<F12>" key for updating the tags file artificially                   " 
 let g:SrcExpl_updateTagsKey = "<F12>" 
"                                                                              " 
" // Set "<F3>" key for displaying the previous definition in the jump list    " 
 let g:SrcExpl_prevDefKey = "<F3>" 
"                                                                              " 
" // Set "<F4>" key for displaying the next definition in the jump list        " 
 let g:SrcExpl_nextDefKey = "<F4>" 
" ==============================================================================

" NERD_tree
" ==============================================================================
" Open and close the NERD_tree.vim separately                                  " 
 nmap <F8>  :NERDTreeToggle<CR>
"                                                                              " 
" This option tells vim whether to display hidden files by default             ".
 let NERDTreeShowHidden=1
"                                                                              " 
" Tells the script where to put the NERD tree window                           " 
 let NERDTreeWinPos="right"
"                                                                              " 
" Sets the window size when the NERD tree is opened                            " 
 let NERDTreeWinSize=35
" ==============================================================================

" Taglist
" ==============================================================================
" Open and close the taglist.vim separately                                    " 
 nmap <silent> <F9> :TlistToggle<CR>
" ==============================================================================

" vim-cpp-enhanced-highlight
" ==============================================================================
" Optional features
" Highlighting of class scope if disabled by default. To enable set
" let g:cpp_class_scope_highlight = 1

" Highlighting of template functions is enabled by setting
" let g:cpp_experimental_template_highlight = 1
" Note: C++ template syntax is notoriously difficult to parse, so don't expect this feature to be perfect."
" ==============================================================================

" DirDiff
" ==============================================================================
" http://myvicommandhelp.blogspot.tw/2010/10/dirdiff-compare-two-folders.html
" http://minimul.com/compare-and-merge-directories-with-dirdiff.html
" #Don't compare directories or filenames that match conditions like CVS,*.swp
 let g:DirDiffExcludes = "system,CVS,*.class,*.exe,.*.swp" 
"
" #Ignore lines that Id:,Revision: etc.
" let g:DirDiffIgnore = "Id:,Revision:,Date:"
"
" #Don't flag files as different based on whitespace
 let g:DirDiffAddArgs = "-w"
" ==============================================================================

" To resolve conflict between snipmate + autocomplpop
" ==============================================================================
" http://mvnllife.blogspot.tw/2013/11/vim-to-ide1-vundlesnipmateautocomplpop.html
 let g:acp_behaviorSnipmateLength = 1
" ==============================================================================

" For auto loading ctags and cscope files
" ==============================================================================
" See :help rtp
  set rtp+=~/.vim/bundle/cscope_maps

" http://vim.wikia.com/wiki/Autoloading_Cscope_Database
  set tags=tags;/

  function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
      let path = strpart(db, 0, match(db, "/cscope.out$"))
      set nocscopeverbose " suppress 'duplicate connection' error
      exe "cs add " . db . " " . path
      set cscopeverbose
    endif
  endfunction
  au BufEnter /* call LoadCscope()
" ==============================================================================

" For GNU GLOBAL (gtags) files
" ==============================================================================
" References:
" Gtags-cscope : 
"   http://www.gnu.org/software/global/globaldoc_toc.html#Gtags_002dcscope
" Learn Vimscript the Hard Way - Functions :
"   http://learnvimscriptthehardway.stevelosh.com/chapters/23.html

" Switch cscope interface to use GNU GLOBAL (gtags) as search engine
function! UseGtags()
  " cscope settings
  set cscopetag                  " Use cscope as tags command
  set cscopeprg='gtags-cscope'   " Use gtags-cscope instead of cscope
  cs kill 0
  cs add GTAGS

  " gtags settings
  let GtagsCscope_Auto_Load = 1
  let CtagsCscope_Auto_Map = 1
  let GtagsCscope_Quiet = 1

  echom "UseGtags!"
endfunction

function! UpdateGtags()
  !global -u

  echom "UpdateGtags!"
endfunction

" Switch cscope interface to use original cscope search engine
function! UseCscope()
  " cscope settings
  set cscopetag           " Use cscope as tags command
  set cscopeprg='cscope'  " Use cscope
  cs kill 0
  call LoadCscope()

  echom "UseCscope!"
endfunction

" ==============================================================================

"" Enable powerline for vim
"" ==============================================================================
"" References:
"" https://powerline.readthedocs.org/en/latest/installation.html
"" https://pip.pypa.io/en/stable/installing/
"" https://github.com/powerline/fonts
"" https://powerline.readthedocs.org/en/latest/usage/other.html#vim-statusline
"" https://github.com/Lokaltog/vim-powerline
"" https://coderwall.com/p/yiot4q/setup-vim-powerline-and-iterm2-on-mac-os-x
"" http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
""
"" Powerline installation directory also can be retrieved via "vim's plugin 'powerline/powerline'"
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/
"" set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim/
"set guifont=Inconsolata\ for\ Powerline:h15
"let g:Powerline_symbols = 'fancy'
"set encoding=utf-8
"set laststatus=2
"set t_Co=256
"set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
"set termencoding=utf-8
"if has("gui_running")
"   let s:uname = system("uname")
"   if s:uname == "Darwin\n"
"      set guifont=Inconsolata\ for\ Powerline:h15
"   endif
"endif
"" TODO : Maybe migrate to vim Airline because Powerline is too heavy and its dependency in Python, details see http://jchain.github.io/blog/2013/07/17/fly-with-vim-airline/
"" ==============================================================================

" For vim-airline
" ==============================================================================
" The default setting of 'laststatus' is for the statusline to not appear until a split is created.
" If you want it to appear all the time, add the following to your vimrc:
set laststatus=2

let g:airline#extensions#tabline#enabled = 1        " Enable tabline
let g:airline#extensions#tabline#left_sep = ' '     " Set left separator
let g:airline#extensions#tabline#left_alt_sep = '|' " Set left separator which are not editting
let g:airline#extensions#tabline#buffer_nr_show = 1 " Show buffer number
let g:airline#extensions#tabline#fnamemod = ':t'    " Configure the formatting of filenames

" Enable/Disable automatic population of the `g:airline_symbols` dictionary with powerline symbols.
" How to install powerline patched fonts : https://github.com/powerline/fonts
let g:airline_powerline_fonts=0

" Themes are automatically selected based on the matching colorscheme. this can be overridden by defining a value.
" Note: Only the dark theme is distributed with vim-airline. For more themes, checkout (https://github.com/vim-airline/vim-airline-themes)
" Change the vim-airline theme : https://github.com/vim-airline/vim-airline/wiki/Screenshots
" let g:airline_theme='dark'
" let g:airline_theme='light'
let g:airline_theme='jellybeans'
" ==============================================================================

" For clang_complete
" ==============================================================================
" References:
" http://www.vim.org/scripts/script.php?script_id=3302
" https://github.com/Rip-Rip/clang_complete
" http://blog.csdn.net/logicworldzju/article/details/8738407
" http://aknow-work.blogspot.tw/2013/04/vim-clangcomplete.html
" https://github.com/Rip-Rip/clang_complete/blob/master/doc/clang_complete.txt
" http://stackoverflow.com/questions/20645920/adding-clang-complete-to-homebrew-installed-vim-on-mac

let g:clang_complete_copen=1                  "If equal to 1, open quickfix window on error. Default: 0
let g:clang_periodic_quickfix=1               "If equal to 1, it will periodically update the quickfix window. Default: 0
let g:clang_snippets=1                        "If equal to 1, it will do some snippets magic on code placeholders like function argument, template parameters, etc. Default: 0
let g:clang_snippets_engine='clang_complete'  "The snippets engine (clang_complete, ultisnips... see the snippets subdirectory). Default: 'clang_complete'
let g:clang_close_preview=1                   "If equal to 1, the preview window will be close automatically after a completion. Default: 0
let g:clang_use_library=1                     "Instead of calling the clang/clang++ tool use libclang directly. This gives
                                              "access to many more clang features. Furthermore it automatically caches all
                                              "includes in memory. Updates after changes in the same file will therefore be a
                                              "lot faster.
                                              "Note: This version doesn't support calling clang binary for completion. If you
                                              "cannot use libclang, you should download clang_complete from vim.org website.
                                              "Default: 1

                                              " g:clang_user_options : 
                                              "Additionnal compilation argument passed to libclang.
                                              "Example: >
                                              " " compile all sources as c++11 (just for example, use .clang_complete for
                                              " " setting version of the language per project)
                                              " let g:clang_user_options = '-std=c++11'
                                              "<
                                              "Default: ""
let g:clang_user_options = '-std=c++11' "Compile all sources as c++11 (just for example, use .clang_complete for setting version of the language per project)
" let g:clang_user_options='-stdlib=libc++ -std=c++11 -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include'

" let s:clang_library_path='/Applications/Xcode.app//Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/' "MacOS
let s:clang_library_path='/usr/lib/llvm-3.6/lib/' "Ubuntu
if isdirectory(s:clang_library_path)
  let g:clang_library_path=s:clang_library_path   "If libclang is not in your library search path->set this to the absolute path
                                                  "where libclang is available. This should either be a directory containing a
                                                  "file named libclang.[dll/so/dylib] or the clang shared library file itself.
                                                  "Default: ""
endif

" Completion is started with CTRL-X CTRL-U |i_CTRL-X_CTRL-U|, or automatically depending on the value of |clang_complete-auto|.
:imap <Leader><Tab> <C-X><C-U>
" ==============================================================================

" PATCH(s)
" ==============================================================================
  " PATCH 'formatoptions' at end of vimrc file to makesure its value won't be
  " chaged by plugins to unwanted value (maybe bundle/tlib_vim/ or
  " bundle/vim-autocomplpop)
  " set formatoptions=tcroq " Auto-wrap text using textwidth
" ==============================================================================

