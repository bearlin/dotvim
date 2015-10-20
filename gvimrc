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
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'wesleyche/SrcExpl'
Plugin 'tpope/vim-commentary'
Plugin 'will133/vim-dirdiff'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
" Syntax highlight
Plugin 'octol/vim-cpp-enhanced-highlight'
" Colorschemes
Plugin 'romainl/Apprentice'
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tejr/sahara'
" Auto completion
Plugin 'othree/vim-autocomplpop'
" Snipmate from github.com/garbas/vim-snipmate
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" ----------------------------------

" plugin from http://vim-scripts.org/vim/scripts.html
" ----------------------------------
Plugin 'L9'
Plugin 'taglist.vim'
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
 " Encoding settings
 set encoding=utf-8
 set fileencodings=utf-8,cp950
 " Editing settings
 syntax on         " This command switches on syntax highlighting, let Vim to overrule your settings with the defaults
 set nocompatible  " Make VIM not vi-compatible
 set autoindent    " Copy indent from current line when starting a new line
 set shiftwidth=2  " Number of spaces to use for each step of (auto)indent
 set tabstop=2     " Number of spaces that a <Tab> in the file counts for
 set softtabstop=2 " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
 set expandtab     " In Insert mode: Use the appropriate number of spaces to insert a <Tab>
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
colorscheme sahara
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
