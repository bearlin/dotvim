" ==============================================================================
" bearlin's vimrc
" Email : <bear.lin.001@gmail.com>
" Repo : https://github.com/bearlin/dotvim
" More info : https://github.com/bearlin/dotvim/blob/master/README.md
" ==============================================================================

set nocompatible

" Plugin manager settings
" ==============================================================================
" Automatic installation for vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

" Source code browsing
" ----------------------------------
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mileszs/ack.vim' " Need to install Ag or Ack for this plugin
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'will133/vim-dirdiff'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/indentpython.vim'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'terryma/vim-multiple-cursors'
Plug 'StanAngeloff/php.vim'
" ----------------------------------

" Code completion
" ----------------------------------
" PHP Autocompletion plugins
    "Requirements
    "Vim 8
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'} " PHP completion, refactoring and introspection tool.
    "Requirements
    "PHP 7.1+
    "Composer
Plug 'ncm2/ncm2' " Slim, Fast and Hackable Completion Framework for Neovim
    "Requirements
    ":echo has("nvim-0.2.2") prints 1. Older versions has not been tested
    ":echo has("python3") prints 1
    "Plugin nvim-yarp
    "For vim8 user, read the nvim-yarp README. Note that vim8 support is simply a bonus. It's not the goal of NCM2.
Plug 'roxma/nvim-yarp' " Yet Another Remote Plugin Framework for Neovim
    "Requirements
    "has('python3')
    "For Vim 8:
    "roxma/vim-hug-neovim-rpc
    "g:python3_host_prog pointed to your python3 executable, or echo exepath('python3') is not empty.
    "neovim python client (pip3 install neovim)
Plug 'roxma/vim-hug-neovim-rpc' " experimental project : a compatibility layer for neovim rpc client working on vim8
Plug 'phpactor/ncm2-phpactor' " NCM2 Integration for Phpactor

" ncm2-snippet plugins
Plug 'ncm2/ncm2-ultisnips' " based on ultisnips
Plug 'SirVer/ultisnips'
" ----------------------------------

" Syntax checker
" ----------------------------------
Plug 'vim-syntastic/syntastic'
" ----------------------------------

" Colorful vim
" ----------------------------------
" vim colorschemes
Plug 'romainl/Apprentice'
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
"Plug 'https://sanctum.geek.nz/code/vim-sahara.git'
Plug 'brafales/vim-desert256'
Plug 'cseelus/vim-colors-lucid'
Plug 'vim-scripts/wombat256.vim'
Plug 'vim-scripts/xoria256.vim'
" Status line
Plug 'itchyny/lightline.vim'
" Syntax
" Plug 'lilydjwg/colorizer' " colorizer: Highlight #rrggbb or #rgb color (http://vimawesome.com/plugin/colorizer-sparks-fly)
" CSV file
" Plug 'mechatroner/rainbow_csv'
" ----------------------------------

" Powerline (not for vim, only for my tmux/bash, see below [Note] for more details)
" ----------------------------------
" [Note]
" Althought my vim changes to vim-airline, my tmux/bash still need powerline binding scripts 
" in ~/.vim/plugged/powerline/powerline/bindings/*, so still need to install powerline plugin here.
Plug 'powerline/powerline'
" ----------------------------------

" Vim-script library
" ----------------------------------
Plug 'vim-scripts/L9'
" ----------------------------------

"Plug 'ludovicchabant/vim-gutentags' " depends on universal-ctags
call plug#end()
" ==============================================================================

" Basic settings
" ==============================================================================
" Encoding settings
set encoding=utf-8
set fileencodings=utf-8,cp950,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
set fileformat=unix

set nocompatible
set t_Co=256      " Make terminal VIM support 256 colors, not just 16 colors

" Default indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=120
set formatoptions=tcroq " Auto-wrap text using textwidth
set expandtab     " In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set autoindent
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
set laststatus=2  " The value of this option influences when the last window will have a status line: 0:never 1:if there are 2 windows 2:always
" set cursorcolumn  " WARNING : VERY SLOW in vim-fugitive. Highlight the screen column of the cursor with CursorColumn

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
" How to copy text when mouse=a: http://stackoverflow.com/questions/4608161/copy-text-out-of-vim-with-set-mouse-a-enabled
set number        " Print the line number in front of each line
" set ttyfast       " Indicates a fast terminal connection, More characters will be sent to the screen for redrawing

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2 " Name of the terminal type for which mouse codes are to be recognized.
set mouse=a       " Enable the use of the mouse in all modes
" set mouse=n       " Enable the use of the mouse only in normal modes
" -----------------------------------

" More natural split opening. Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright

" Show special characters
" -----------------------------------
set list
if has('win32unix') " Cygwin
  set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<
else
  " set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
  " set listchars=eol:$,tab:\|_,trail:.,extends:>,precedes:<
  set listchars=eol:↲,tab:▸\ ,trail:·,extends:»,precedes:«
endif
" -----------------------------------

" Statusline and background color
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
set background=dark

" Change mapleader to ','
let mapleader=","

" Easier split window navigations 
" -----------------------------------
" Easier split navigations 
" We can use different key mappings for easy navigation between splits to save a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
" About nmap and nnoremap: http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" -----------------------------------

" Easier Cut/Copy/Paste
" -----------------------------------
" <Leader>x are Cut in visual mode
vnoremap <Leader>x "*x
" <Leader>y are Copy in visual mode
vnoremap <Leader>y "*y
" <Leader>p are Paste in normal mode and command line mode
nnoremap <Leader>p "*p
cnoremap <Leader>p <C-R>*
" -----------------------------------

" Hex editing using xxd tool
" -----------------------------------
" http://nion.modprobe.de/blog/archives/628-vim-as-hex-editor.html
" nnoremap <Leader>hexon :%!xxd<CR>
" nnoremap <Leader>hexof :%!xxd -r<CR>
" -----------------------------------

" Insert current file/directory name/path
" -----------------------------------
" To insert the current directory name of current file:
" :inoremap <Leader><Leader>dnt <C-R>=expand("%:p:h:t")<CR>
" Inserts the current filename with the extension
" :inoremap <Leader><Leader>fnt <C-R>=expand("%:t")<CR>
" Inserts the current filename without the extension
" :inoremap <Leader><Leader>fne <C-R>=expand("%:t:r")<CR>

" To insert the relative file path of current file:
" :inoremap <Leader><Leader>fnr <C-R>=expand("%")<CR>
" To insert the absolute file path of current file:
" :inoremap <Leader><Leader>fna <C-R>=expand("%:p")<CR>
" To insert the relative directory path of current file:
" :inoremap <Leader><Leader>dnr <C-R>=expand("%:h")<CR>
" To insert the absolute directory path of current file:
" :inoremap <Leader><Leader>dna <C-R>=expand("%:p:h")<CR>
" -----------------------------------

" Buffers operations
" -----------------------------------
" http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" This allows buffers to be hidden if you've modified a buffer. This is almost a must if you wish to use buffers in this way.
" set hidden
" To open a new empty buffer.
nnoremap <leader><Leader>bB :enew<CR>
nnoremap <leader><Leader>bn :bnext<CR>
nnoremap <leader><Leader>bp :bprevious<CR>
" Close the current buffer and move to the previous one. This replicates the idea of closing a tab
nnoremap <leader><Leader>bq :bprevious <BAR> bdelete #<CR>
" Show all open buffers and their status
nnoremap <leader><Leader>bl :buffers<CR>
" -----------------------------------

" Useful mappings for managing tabs
" -----------------------------------
nnoremap <leader><Leader>tn :tabnew<cr>
nnoremap <leader><Leader>te :tabedit %<cr>
nnoremap <leader><Leader>tc :tabclose<cr>
nnoremap <leader><Leader>to :tabonly<cr>
nnoremap <leader><Leader>tml :tabmove -1<cr>
nnoremap <leader><Leader>tmr :tabmove +1<cr>
" -----------------------------------

" Treat long lines as break lines (useful when moving around in them)
" -----------------------------------
nnoremap j gj
nnoremap k gk
" -----------------------------------

" Color schemes
" -----------------------------------
":silent! colorscheme lucid
":silent! colorscheme desert256
":silent! colorscheme sahara
":silent! colorscheme apprentice
":silent! colorscheme solarized
":silent! colorscheme wombat
":silent! colorscheme grb256
":silent! colorscheme jellybeans
:silent! colorscheme xoria256
" -----------------------------------
" ==============================================================================

" ************************************
" ****** Plugins settings start ******
" ************************************
" NERD_tree
" ------------------------------------------------------------------------------
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <Leader><leader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeWinPos="right"
let NERDTreeWinSize=35
" ------------------------------------------------------------------------------

" tagbar
" ------------------------------------------------------------------------------
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_left = 1
" ------------------------------------------------------------------------------

" vim-cpp-enhanced-highlight
" ------------------------------------------------------------------------------
" Optional features
" Highlighting of class scope if disabled by default. To enable set
" let g:cpp_class_scope_highlight = 1

" Highlighting of template functions is enabled by setting
" let g:cpp_experimental_template_highlight = 1
" Note: C++ template syntax is notoriously difficult to parse, so don't expect this feature to be perfect."
" ------------------------------------------------------------------------------

" DirDiff
" ------------------------------------------------------------------------------
let g:DirDiffExcludes = "system,CVS,*.class,*.exe,.*.swp" 
" #Ignore lines that Id:,Revision: etc.
" let g:DirDiffIgnore = "Id:,Revision:,Date:"
" #Don't flag files as different based on whitespace
let g:DirDiffAddArgs = "-w"
" ------------------------------------------------------------------------------

" For auto loading ctags and cscope files
" ------------------------------------------------------------------------------
" See :help rtp
" set rtp+=~/.vim/bundle/cscope_maps
" Vim will look for tags file everywhere starting from the current directory up
" to the root. Ref : http://vim.wikia.com/wiki/Autoloading_Cscope_Database
" set tags=tags;/

" function! LoadCscope()
  " " Searches from the directory of the current file upwards until it finds
  " " the file "cscope.out", see :h file-searching for ".;".
  " let db = findfile("cscope.out", ".;")
  " if (!empty(db))
    " let path = strpart(db, 0, match(db, "/cscope.out$"))
    " set nocscopeverbose " suppress 'duplicate connection' error
    " exe "cs add " . db . " " . path
    " set cscopeverbose
  " endif
" endfunction
" autocmd BufEnter /* call LoadCscope()
" ------------------------------------------------------------------------------

" For GNU GLOBAL (gtags) files
" ------------------------------------------------------------------------------
" References:
" Gtags-cscope : 
"   https://www.gnu.org/software/global/globaldoc_toc.html#gtags_002dcscope
" Learn Vimscript the Hard Way - Functions :
"   http://learnvimscriptthehardway.stevelosh.com/chapters/23.html

" Switch VIM's cscope interface to use 'gtags-cscope' (cscope port for GNU GLOBAL) as search engine
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
" ------------------------------------------------------------------------------

" lightline.vim
set laststatus=2

" NERD Commenter
" ------------------------------------------------------------------------------
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
" ------------------------------------------------------------------------------

" vim-indent-guides
" ------------------------------------------------------------------------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
" :nmap <silent> <Leader><Leader>ii <Plug>IndentGuidesToggle
" ------------------------------------------------------------------------------

" mileszs/ack.vim
" ------------------------------------------------------------------------------
if executable('ag') "Ag
  let g:ackprg = 'ag --vimgrep'
  let g:ack_default_options = '--ignore=.git --ignore=.idea --ignore=tags'
  nnoremap <Leader><Leader>aq :Ack! <C-R><C-W> -iw
  nnoremap <Leader><Leader>al :LAck! <C-R><C-W> -iw
elseif executable('ack') "Ack
  let g:ackprg = 'ack'
  nnoremap <Leader><Leader>aq :Ack! --ignore-dir=.git --ignore-dir=.idea --ignore-file=match:/tags$/ <C-R><C-W> -iw
  nnoremap <Leader><Leader>al :LAck! --ignore-dir=.git --ignore-dir=.idea --ignore-file=match:/tags$/ <C-R><C-W> -iw
else "Normal grep
  let g:ackprg = 'grep'
  " ack pattern to 'quickfix-window'
  nnoremap <Leader><Leader>aq :Ack! --ignore-dir=.git --ignore-dir=.idea --ignore-file=match:/tags$/ <C-R><C-W> -iw
  " ack pattern to 'location-list-window'
  nnoremap <Leader><Leader>al :LAck! --ignore-dir=.git --ignore-dir=.idea --ignore-file=match:/tags$/ <C-R><C-W> -iw
endif
" ------------------------------------------------------------------------------

" PHP Autocompletion plugins
" ------------------------------------------------------------------------------
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Phpactor : Keyboard Mappings
nmap <Leader><Leader>pua :call phpactor#UseAdd()<CR>
nmap <Leader><Leader>pcm :call phpactor#ContextMenu()<CR>
nmap <Leader><Leader>pnv :call phpactor#Navigate()<CR>
nmap <Leader><Leader>pgd :call phpactor#GotoDefinition()<CR>
nmap <Leader><Leader>pgr :call phpactor#FindReferences()<CR>
nmap <Leader><Leader>pii :call phpactor#Hover()<CR>
nmap <Leader><Leader>ptf :call phpactor#Transform()<CR>
nmap <Leader><Leader>pcn :call phpactor#ClassNew()<CR>
nmap <silent><Leader><Leader>pee :call phpactor#ExtractExpression(v:false)<CR>
vmap <silent><Leader><Leader>pes :<C-U>call phpactor#ExtractExpression(v:true)<CR>
vmap <silent><Leader><Leader>pem :<C-U>call phpactor#ExtractMethod()<CR>
" ------------------------------------------------------------------------------

" ncm2-ultisnips settings
" ------------------------------------------------------------------------------
" Press enter key to trigger snippet expansion. The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" ------------------------------------------------------------------------------

" vim-syntastic/syntastic
" ------------------------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" syntastic for PHP : To install phpcs/phpmd: composer require --dev phpmd/phpmd and composer require --dev squizlabs/php_codesniffer
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" phpcs: Normal
let g:syntastic_php_phpcs_exec = './vendor/bin/phpcs'
let g:syntastic_php_phpcs_args = '--standard=psr2'

" phpmd
let g:syntastic_php_phpmd_exec = './vendor/bin/phpmd'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'

let g:syntastic_javascript_checkers = ['jshint']
" ------------------------------------------------------------------------------

" ctrlpvim/ctrlp.vim
" ------------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>' "<Leader><Leader>p'
let g:ctrlp_cmd = 'CtrlP'
" map <Leader><Leader>b :CtrlPBuffer<CR>
" map <Leader><Leader>f :CtrlPMRU<CR>
" map <Leader><Leader>m :CtrlPMixed<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0 "'ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
" ------------------------------------------------------------------------------

