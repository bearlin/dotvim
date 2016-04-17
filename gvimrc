" ==============================================================================
" bearlin's vimrc
" Email : <bear.lin.001@gmail.com>
" Repo : https://github.com/bearlin/dotvim
" More info : https://github.com/bearlin/dotvim/blob/master/README.md
" ==============================================================================

" Section for Vundle Vim plugin manage
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
" ------------------------------------------------------------------------------
" Source code browsing
" ----------------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'

" Text alignment
"Plugin 'vim-scripts/matchit.zip' " Disable because it has bug while matching simple (), [] in large html file.
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'nathanaelkane/vim-indent-guides'

" Text objects
Plugin 'michaeljsmith/vim-indent-object'

" Git
Plugin 'tpope/vim-fugitive'
" Diff
Plugin 'will133/vim-dirdiff'
" C++
Plugin 'octol/vim-cpp-enhanced-highlight'
" Python
Plugin 'vim-scripts/indentpython.vim'
" ----------------------------------

" Debugging
" ----------------------------------
Plugin 'vim-scripts/Conque-GDB'
" ----------------------------------

" Code completion
" ----------------------------------
" TODO: Use YouCompleteMe to replace above completion plugins
" YouCompleteMe obsoletes the following Vim plugins because it has all of their features plus extra
" clang_complete
" AutoComplPop
" Supertab
" neocomplcache
"
Plugin 'ervandew/supertab'
Plugin 'othree/vim-autocomplpop'
Plugin 'Rip-Rip/clang_complete'
" ----------------------------------

" Snipmate engine
" ----------------------------------
" From github.com/garbas/vim-snipmate
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" ----------------------------------

" Colorful vim
" ----------------------------------
" vim colorschemes
Plugin 'romainl/Apprentice'
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tejr/sahara'

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Syntax
Plugin 'lilydjwg/colorizer' " colorizer: Highlight #rrggbb or #rgb color (http://vimawesome.com/plugin/colorizer-sparks-fly)
" ----------------------------------

" ------------------------------------------------------------------------------

" plugin from http://vim-scripts.org/vim/scripts.html
" ------------------------------------------------------------------------------
" Vim-script library
" ----------------------------------
Plugin 'L9'
" ----------------------------------
" ------------------------------------------------------------------------------

" Git plugin not hosted on GitHub
" ------------------------------------------------------------------------------
" Plugin 'git://git.wincent.com/command-t.git'
" ------------------------------------------------------------------------------
"
" git repos on your local machine (i.e. when working on your own plugin)
" ------------------------------------------------------------------------------
" Plugin 'file:///home/gmarik/path/to/plugin'
" ------------------------------------------------------------------------------
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
  autocmd BufNewFile,BufRead *.c *.h *.cpp *.cxx *.cc *.hpp *.inl
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
  autocmd BufNewFile,BufRead *.py
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
  autocmd BufNewFile,BufRead *.js, *.html, *.css
  \ setlocal
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2
  " ----------------
 " set noexpandtab
 set ruler         " Show the line and column number of the cursor position, separated by a comma
 set backspace=2   " Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode. 在 insert 也可用 backspace
 set ignorecase    " Ignore case in search patterns
 set smartcase     " Override the 'ignorecase' option if the search pattern contains upper case characters
 set hlsearch      " When there is a previous search pattern, highlight all its matches
 set incsearch     " While typing a search command, show where the pattern, as it was typed so far, matches
 set smartindent   " Do smart autoindenting when starting a new line
 set confirm       " When unsaved changes to a buffer, e.g. ":q" and ":e", raise a |dialog| asking if you wish to save the current file(s)
 set history=200   " A history of ":" commands, and a history of previous search patterns, how many will be remembered
 set cursorline    " Highlight the screen line of the cursor with CursorLine
 " set cursorcolumn  " Highlight the screen column of the cursor with CursorColumn
 set laststatus=2  " The value of this option influences when the last window will have a status line: 0:never 1:if there are 2 windows 2:always
" set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]

" zsh Command-line completion style
 set wildmenu      " When 'wildmenu' is on, command-line completion operates in an enhanced mode
 set wildmode=full
" bash Command-line completion style
 " set wildmode=longest,list

" Set diffsplit/diffthis/diffpatch to vertical style
 set diffopt=filler,vertical
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
  " nnoremap - <C-W>-
  " nnoremap + <C-W>+
  " if has("autocmd")
  "   function! SetWindowHOperation()
  "     if winnr() == 1
  "       nnoremap < <C-W><
  "       nnoremap > <C-W>>
  "     else
  "       nnoremap < <C-W>>
  "       nnoremap > <C-W><
  "     endif
  "   endfunction
  "   autocmd BufEnter,BufLeave /* call SetWindowHOperation()
  " endif
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
if has('win32unix') " Cygwin
  set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<
else
  " set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
  " set listchars=eol:$,tab:\|_,trail:.,extends:>,precedes:<
  set listchars=eol:↲,tab:▸\ ,trail:·,extends:»,precedes:«
endif
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
:silent! colorscheme sahara
":silent! colorscheme apprentice
":silent! colorscheme solarized
":silent! colorscheme wombat
":silent! colorscheme grb256
":silent! colorscheme jellybeans
" -----------------------------------

" Hex editing using xxd tool
" -----------------------------------
" http://nion.modprobe.de/blog/archives/628-vim-as-hex-editor.html
 noremap <Leader>hexon :%!xxd<CR>
 noremap <Leader>hexof :%!xxd -r<CR>

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
" :h expand
"
" expand() conecpts:
" When {expr} starts with '%', '#' or '<', the expansion is done
" like for the |cmdline-special| variables with their associated
" modifiers.  Here is a short overview:
"        %             current file name
"        #             alternate file name
"        #n            alternate file name n
"        <cfile>       file name under the cursor
"        <afile>       autocmd file name
"        <abuf>        autocmd buffer number (as a String!)
"        <amatch>      autocmd matched name
"        <sfile>       sourced script file or function name
"        <slnum>       sourced script file line number
"        <cword>       word under the cursor
"        <cWORD>       WORD under the cursor
"        <client>      the {clientid} of the last received
" Modifiers:
"        :p            expand to full path
"        :h            head (last path component removed)
"        :t            tail (last path component only)
"        :r            root (one extension removed)
"        :e            extension only
" For example a file /abc/def/my.txt:
" :echo @%                    def/my.txt        directory/name of file (relative to the current working directory of /abc)
" :echo expand('%:t')         my.txt            name of file ('tail')
" :echo expand('%:p')         /abc/def/my.txt   full path
" :echo expand('%:p:h')       /abc/def          directory containing file ('head')
" :echo expand('%:p:h:t')     def               First get the full path with :p (/abc/def/my.txt), then get the head of 
"                                               that with :h (/abc/def), then get the tail of that with :t (def)
"
" To insert the current directory name of current file:
:inoremap <Leader><Leader>dnt <C-R>=expand("%:p:h:t")<CR>
" Inserts the current filename with the extension
:inoremap <Leader><Leader>fnt <C-R>=expand("%:t")<CR>
" Inserts the current filename without the extension
:inoremap <Leader><Leader>fne <C-R>=expand("%:t:r")<CR>

" To insert the relative file path of current file:
:inoremap <Leader><Leader>fnr <C-R>=expand("%")<CR>
" To insert the absolute file path of current file:
:inoremap <Leader><Leader>fna <C-R>=expand("%:p")<CR>
" To insert the relative directory path of current file:
:inoremap <Leader><Leader>dnr <C-R>=expand("%:h")<CR>
" To insert the absolute directory path of current file:
:inoremap <Leader><Leader>dna <C-R>=expand("%:p:h")<CR>
" -----------------------------------

" Buffers operations
" -----------------------------------
" http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" This allows buffers to be hidden if you've modified a buffer. This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer. This replaces :tabnew which I used to bind to this mapping
nmap <leader><Leader>bB :enew<CR>
" Move to the next buffer
nmap <leader><Leader>bn :bnext<CR>
" Move to the previous buffer
nmap <leader><Leader>bp :bprevious<CR>
" Close the current buffer and move to the previous one. This replicates the idea of closing a tab
nmap <leader><Leader>bq :bprevious <BAR> bdelete #<CR>
" Show all open buffers and their status
nmap <leader><Leader>bl :buffers<CR>
" -----------------------------------

" Useful mappings for managing tabs
" -----------------------------------
map <leader><Leader>tn :tabnew<cr>
map <leader><Leader>to :tabonly<cr>
map <leader><Leader>tc :tabclose<cr>
map <leader><Leader>tm :tabmove
" -----------------------------------

" Treat long lines as break lines (useful when moving around in them)
" -----------------------------------
map j gj
map k gk
" -----------------------------------

" Compile single file with gcc/g++ in vim
" -----------------------------------
" [20160308]
" Disable this section because I am learning how to write Makefile now, so
" current I prefer just add a Makefile and compile your project with :make
"
" [:make with makeprg]
" autocmd FileType c set makeprg=gcc\ -g\ -Wall\ %
" autocmd FileType cpp set makeprg=g++\ -g\ -Wall\ %
" " autocmd FileType cpp set makeprg=cd\ ~/ws/geo/\ &&\ ./build_navkit.sh\ geo\ debug\ &&\ cd\ ~/ws/geo/navkit_geo/
" map <leader><leader>make :make<CR> <bar> :cwindow<CR>
" map <leader><leader>run :!./a.out<CR>
" map <leader><leader>cln :!rm -r a.out*<CR>
" [:make without makeprg]
" map <leader><leader>make :!g++ -g -Wall % -o %:r.out<CR>
" map <leader><leader>run :!./%:r.out<CR>
" map <leader><leader>cln :!rm -r %:r.out*<CR>
"
" References:
" http://unix.stackexchange.com/questions/52559/how-to-compile-a-c-program-without-leaving-the-editor
" http://stackoverflow.com/questions/2627886/how-do-i-run-a-c-program-from-vim
" https://www.reddit.com/r/vim/comments/3fdd7l/compile_simple_programs_with_vim_in_c/
" -----------------------------------

" ************************************
" ****** Plugins settings start ******
" ************************************
" NERD_tree
" ==============================================================================
" Open and close the NERD_tree.vim separately                                  " 
 nmap <F8> :NERDTreeToggle<CR>
 nmap <Leader><leader>nf :NERDTreeFind<CR>
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

" tagbar
" ==============================================================================
" Open and close the taglist.vim separately                                    " 
 nmap <silent> <F9> :TagbarToggle<CR>
 let g:tagbar_ctags_bin = 'ctags'
 let g:tagbar_width = 30
 let g:tagbar_left = 1
" References:
" http://blog.jasonding.top/2015/04/29/Developer%20Kits/%E3%80%90Vim%E3%80%91%E4%BD%BF%E7%94%A8Vundle%E7%AE%A1%E7%90%86%E9%85%8D%E7%BD%AEVim%E5%9F%BA%E6%9C%AC%E6%8F%92%E4%BB%B6/
" http://www.vimer.cn/2011/03/%E6%9B%B4%E9%80%82%E5%90%88%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1%E8%AF%AD%E8%A8%80%E4%BD%BF%E7%94%A8%E7%9A%84%E6%98%BE%E7%A4%BA%E5%87%BD%E6%95%B0%E5%88%97%E8%A1%A8%E6%8F%92%E4%BB%B6-tagbar-vim.html
" ==============================================================================

" colorizer
" ==============================================================================
" Examples:
" #ff0000 or #f00 will be display with red color
" #00ff00 or #0f0 will be display with green color
" #0000ff or #00f will be display with blue color
" By default, <leader>tc is mapped to ColorToggle. If you want to use another key map, do like this:
"  nmap <leader><leader>colort <Plug>Colorizer
" References : http://www.vim.org/scripts/script.php?script_id=3567
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
" (Update) othree/vim-autocomplpop already support arbas/vim-snipmate, so this
" blow can be removed, more details at https://github.com/othree/vim-autocomplpop
"
" http://mvnllife.blogspot.tw/2013/11/vim-to-ide1-vundlesnipmateautocomplpop.html
" let g:acp_behaviorSnipmateLength = 1
" ==============================================================================

" For auto loading ctags and cscope files
" ==============================================================================
" See :help rtp
  set rtp+=~/.vim/bundle/cscope_maps

" Vim will look for tags file everywhere starting from the current directory up
" to the root. Ref : http://vim.wikia.com/wiki/Autoloading_Cscope_Database
  set tags=tags;/

  function! LoadCscope()
    " Searches from the directory of the current file upwards until it finds
    " the file "cscope.out", see :h file-searching for ".;".
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
      let path = strpart(db, 0, match(db, "/cscope.out$"))
      set nocscopeverbose " suppress 'duplicate connection' error
      exe "cs add " . db . " " . path
      set cscopeverbose
    endif
  endfunction
  autocmd BufEnter /* call LoadCscope()
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

let g:clang_complete_copen=0                  "If equal to 1, open quickfix window on error. Default: 0
let g:clang_hl_errors=1                       "If equal to 1, it will highlight the warnings and errors the same way clang does it. Default: 1
let g:clang_periodic_quickfix=0               "If equal to 1, it will periodically update the quickfix window. Default: 0
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
if has('win32unix') " Cygwin
  let s:clang_library_path='/lib/'
elseif has('win32') || has('win64') " Windows
  let s:clang_library_path='D:\Sourcen\LLVM\build\bin\Debug'
elseif has('mac') " MacOS 
  let s:clang_library_path='/Applications/Xcode.app//Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
elseif has('unix') " Ubuntu
  let s:clang_library_path='/usr/lib/llvm-3.6/lib/'
else
  let s:clang_library_path='/usr/lib/'
endif
if isdirectory(s:clang_library_path)
  let g:clang_library_path=s:clang_library_path   "If libclang is not in your library search path->set this to the absolute path
                                                  "where libclang is available. This should either be a directory containing a
                                                  "file named libclang.[dll/so/dylib] or the clang shared library file itself.
                                                  "Default: ""
endif

" Completion is started with CTRL-X CTRL-U |i_CTRL-X_CTRL-U|, or automatically depending on the value of |clang_complete-auto|.
"  imap <Leader><Leader><Tab> <C-X><C-U>
" ==============================================================================

" For easymotion
" ==============================================================================
" Below info from :h easymotion-default-mappings
  map <Leader><Leader>em <Plug>(easymotion-prefix)
"   Default Mapping      | Details
"   ---------------------|----------------------------------------------
"   <Leader>f{char}      | Find {char} to the right. See |f|.
"   <Leader>F{char}      | Find {char} to the left. See |F|.
"   <Leader>t{char}      | Till before the {char} to the right. See |t|.
"   <Leader>T{char}      | Till after the {char} to the left. See |T|.
"   <Leader>w            | Beginning of word forward. See |w|.
"   <Leader>W            | Beginning of WORD forward. See |W|.
"   <Leader>b            | Beginning of word backward. See |b|.
"   <Leader>B            | Beginning of WORD backward. See |B|.
"   <Leader>e            | End of word forward. See |e|.
"   <Leader>E            | End of WORD forward. See |E|.
"   <Leader>ge           | End of word backward. See |ge|.
"   <Leader>gE           | End of WORD backward. See |gE|.
"   <Leader>j            | Line downward. See |j|.
"   <Leader>k            | Line upward. See |k|.
"   <Leader>n            | Jump to latest "/" or "?" forward. See |n|.
"   <Leader>N            | Jump to latest "/" or "?" backward. See |N|.
"   <Leader>s            | Find(Search) {char} forward and backward.
"                        | See |f| and |F|.
" ==============================================================================

" For vim-fugitive
" ==============================================================================
" | git             | fugitive  | action
" |-----------------|-----------|-----------------------------------------------
" | :Git add %      | :Gwrite   | Stage the current file to the index
" | :Git checkout % | :Gread    | Revert current file to last checked in version
" | :Git rm %       | :Gremove  | Delete the current file and the corresponding Vim buffer
" | :Git mv %       | :Gmove    | Rename the current file and the corresponding Vim buffer
" | :Git commit     | :Gcommit  | Open commit window, can use Vim’s keyword autocompletion when composing commit message
" | :Git blame      | :Gblame   | Open blame window, each line with: the last commit, author and timestamp
" |-----------------|-----------|-----------------------------------------------
"   NOTE : More commands please use :h fugitive-commands
"
" References:
" http://www.d0u9.xyz/vimcha-jian-jie-shao-fugitive/
" http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
" http://quickteckiteasy.blogspot.tw/2013/11/vim-plugin-fugative-vim-git.html
" ==============================================================================

" NERD Commenter
" ==============================================================================
" Specifies whether to add extra spaces around delimiters when commenting, and
" whether to remove them when uncommenting.
let g:NERDSpaceDelims=1

" Functionality summary:
"<Leader>cc       "Comment out the current line or text selected in visual mode.
"<Leader>cl       "Same as <Leader>cc except that the delimiters are aligned down the
"<Leader>cb       "left side (<Leader>cl) or both sides (<Leader>cb).
"<Leader>ca       "Switches to the alternative set of delimiters.
"<Leader>cu       "Uncomments the selected line(s).
"<Leader>cA       "Adds comment delimiters to the end of line and goes into insert mode between them.
"<Leader>cs       "Comments out the selected lines ``sexily''
"<Leader>c<space> "Toggles the comment state of the selected line(s). If the topmost selected
                  "line is commented, all selected lines are uncommented and vice versa.
"<Leader>cn       "Same as <Leader>cc but forces nesting.
"<Leader>cm       "Comments the given lines using only one set of multipart delimiters.
"<Leader>ci       "Toggles the comment state of the selected line(s) individually.
"<Leader>cy       "Same as <Leader>cc except that the commented line(s) are yanked first.
"<Leader>c$       "Comments the current line from the cursor to the end of line.
"
" References:
" :h NERDComFunctionalitySummary
" https://github.com/scrooloose/nerdcommenter
" http://www.wklken.me/posts/2015/06/07/vim-plugin-nerdcommenter.html
" http://www.dutor.net/index.php/2010/05/vim-the-nerd-commenter/
" ==============================================================================

" tabular
" ==============================================================================
" if exists(":Tabularize") " Disable according to http://stackoverflow.com/questions/8540232/why-doesnt-my-vim-mapping-work
  nmap <Leader><Leader>tabu= :Tabularize /=<CR>
  vmap <Leader><Leader>tabu= :Tabularize /=<CR>
  nmap <Leader><Leader>tabu: :Tabularize /:\zs<CR>
  vmap <Leader><Leader>tabu: :Tabularize /:\zs<CR>
" endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

" References:
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" ==============================================================================

" Conque-GDB
" ==============================================================================
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 1 " display warning messages if conqueTerm is configured incorrectly
let g:ConqueTerm_ReadUnfocused = 1 " conque buffers will continue to update after you've switched to another buffer.
" Set the leader key mapping:
" We may not use ConqueGDB quite often, and the same leader character may conflict with
" other options of vim or other plugins. So use '\' instead of '<Leader>'
" References: https://jianfengwang.wordpress.com/2015/11/06/tips-of-gdb-with-vim/
let g:ConqueGdb_Leader = '\'

" Key mappings
let g:ConqueGdb_Run         = g:ConqueGdb_Leader . 'r'
let g:ConqueGdb_Continue    = g:ConqueGdb_Leader . 'c'
let g:ConqueGdb_Next        = g:ConqueGdb_Leader . 'n'
let g:ConqueGdb_Step        = g:ConqueGdb_Leader . 's'
let g:ConqueGdb_Print       = g:ConqueGdb_Leader . 'p'
let g:ConqueGdb_ToggleBreak = g:ConqueGdb_Leader . 'b'
let g:ConqueGdb_DeleteBreak = g:ConqueGdb_Leader . 'd'
let g:ConqueGdb_Finish      = g:ConqueGdb_Leader . 'f'
let g:ConqueGdb_Backtrace   = g:ConqueGdb_Leader . 't'
" Start the ConqueGdb
"Type :ConqueGdb <gdb-arguments> to launch GDB in the current window. E.g.:
"    :ConqueGdb
"    :ConqueGdb program
"    :ConqueGdb -d dir --args program [arguments]
"Open GDB in a new horizontal:
"    :ConqueGdbSplit
"    :ConqueGdbVSplit
nmap <leader><Leader>dbs :ConqueGdbSplit<CR>
nmap <leader><Leader>dbv :ConqueGdbVSplit<CR>
nmap <leader><Leader>dbt :ConqueGdbTab<CR>

"
" References:
" http://vi.stackexchange.com/questions/2046/how-can-i-integrate-gdb-with-vim
" https://jianfengwang.wordpress.com/2015/11/06/tips-of-gdb-with-vim/
" :h conque_gdb.txt
" :h conque_term.txt
" ==============================================================================

"vim-indent-guides
" ==============================================================================
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader><Leader>ii <Plug>IndentGuidesToggle
" References:
" https://github.com/yangyangwithgnu/use_vim_as_ide#4.2
" http://foocoder.com/blog/mei-ri-vimcha-jian-suo-jin-xian-shi-vim-indent-guides.html/
" ==============================================================================

" PATCH(s)
" ==============================================================================
  " PATCH 'formatoptions' at end of vimrc file to makesure its value won't be
  " chaged by plugins to unwanted value (maybe bundle/tlib_vim/ or
  " bundle/vim-autocomplpop)
  " set formatoptions=tcroq " Auto-wrap text using textwidth
" ==============================================================================

" Handy functions
" ==============================================================================
" Load my favorite colorscheme
" ------------------------------------------------------------------------
function! FavoriteColorSchemeLoad()
  let l:colorscheme = "sahara"
  exe "colorscheme ". l:colorscheme
endfunction
" ------------------------------------------------------------------------

" session/viminfo managements
" ------------------------------------------------------------------------
" [Session]
" A Session keeps the Views for all windows, plus the global settings.  You can
" save a Session and when you restore it later the window layout looks the same.
" You can use a Session to quickly switch between different projects,
" automatically loading the files you were last working on in that project.
" Views and Sessions are a nice addition to viminfo-files, which are used to
" remember information for all Views and Sessions together |viminfo-file|.
"
" [viminfo]
" If you exit Vim and later start it again, you would normally lose a lot of
" information.  The viminfo file can be used to remember that information, which
" enables you to continue where you left off. The viminfo file is used to store:
" - The command line history.
" - The search string history.
" - The input-line history.
" - Contents of non-empty registers.
" - Marks for several files.
" - File marks, pointing to locations in files.
" - Last search/substitute pattern (for 'n' and '&').
" - The buffer list.
" - Global variables.
"
" [References]
" :h session
" :h viminfo
" :h internal-variables
" https://nixtricks.wordpress.com/2009/11/02/vim-save-and-use-vim-sessions/
" http://easwy.com/blog/archives/advanced-vim-skills-session-file-and-viminfo/
" http://vim.wikia.com/wiki/Go_away_and_come_back
"
function! SessionSave()
  "let l:sessiondir = $HOME . "/.vim/vimsessions" . getcwd()
  let l:sessiondir = "./.vimsession"
  if (filewritable(l:sessiondir) != 2)
    exe 'silent !mkdir -p ' l:sessiondir
    redraw!
  endif
  let l:sessionfile = l:sessiondir . '/session.vim'
  exe "mksession! " . l:sessionfile
  echom "Session \"" . l:sessionfile . "\" Saved!"
endfunction
function! SessionLoad()
  "let l:sessiondir = $HOME . "/.vim/vimsessions" . getcwd()
  let l:sessiondir = "./.vimsession"
  let l:sessionfile = l:sessiondir . "/session.vim"
  if (filereadable(l:sessionfile))
    exe 'source ' l:sessionfile
  else
    echo "No session loaded."
  endif
  echom "Session \"" . l:sessionfile . "\" Loaded!"
endfunction

function! ViminfoSave()
  "let l:sessiondir = $HOME . "/.vim/vimsessions" . getcwd()
  let l:sessiondir = "./.vimsession"
  if (filewritable(l:sessiondir) != 2)
    exe 'silent !mkdir -p ' l:sessiondir
    redraw!
  endif
  let l:viminfofile = l:sessiondir . '/viminfo.vim'
  exe "wviminfo! " . l:viminfofile
  echom "viminfo \"" . l:viminfofile . "\" Saved!"
endfunction
function! ViminfoLoad()
  "let l:sessiondir = $HOME . "/.vim/vimsessions" . getcwd()
  let l:sessiondir = "./.vimsession"
  let l:viminfofile = l:sessiondir . '/viminfo.vim'
  if (filereadable(l:viminfofile))
    exe "rviminfo! " . l:viminfofile
  else
    echo "No viminfo loaded."
  endif
  echom "viminfo \"" . l:viminfofile . "\" Loaded!"
endfunction

function! VimSave()
  call SessionSave()
  call ViminfoSave()
  echom "VimSave() done!"
endfunction
function! VimLoad()
  call SessionLoad()
  call ViminfoLoad()
  call FavoriteColorSchemeLoad()
  echom "VimLoad() done!"
endfunction
" autocmd VimEnter * nested :call VimLoad()
" autocmd VimLeave * :call VimSave()
" ------------------------------------------------------------------------
" ==============================================================================

