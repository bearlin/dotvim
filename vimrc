" ==============================================================================
" bearlin's vimrc
" Email : <bear.lin.001@gmail.com>
" Repo : https://github.com/bearlin/dotvim
" More info : https://github.com/bearlin/dotvim/blob/master/README.md
" ==============================================================================

set nocompatible              " be iMproved, required

" Section for Vim plugin manage
" ==============================================================================

" Automatic installation for vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Vim help
" ----------------------------------
Plug 'junegunn/vim-plug' "If you need Vim help for vim-plug itself (e.g. :help plug-options), register vim-plug as a plugin
" ----------------------------------

" Source code browsing
" ----------------------------------
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'will133/vim-dirdiff'
Plug 'mileszs/ack.vim'            " Need to install Ack before use this plugin
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/indentpython.vim'
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
" in ~/.vim/bundle/powerline/powerline/bindings/*, so still need to install powerline plugin here.
Plug 'powerline/powerline'
" ----------------------------------

" Vim-script library
" ----------------------------------
Plug 'vim-scripts/L9'
" ----------------------------------

" Initialize plugin system
call plug#end()
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
 set nocompatible  " Make VIM not vi-compatible
 set t_Co=256      " Make terminal VIM support 256 colors, not just 16 colors

 " Default indentation/fileformat settings
 set tabstop=4     " Number of spaces that a <Tab> in the file counts for
 set softtabstop=4 " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
 set shiftwidth=4  " Number of spaces to use for each step of (auto)indent
 set textwidth=79  " Maximum width of text that is being inserted. A longer line will be broken after white space to get this width.
 set formatoptions=tcroq " Auto-wrap text using textwidth
 set expandtab     " In Insert mode: Use the appropriate number of spaces to insert a <Tab>
 set autoindent    " Copy indent from current line when starting a new line
 set fileformat=unix
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
 " set cursorcolumn  " WARNING : VERY SLOW in vim-fugitive. Highlight the screen column of the cursor with CursorColumn
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
 let mapleader=","
" -----------------------------------

" Easier split window navigations 
" -----------------------------------
" Easier split navigations 
" We can use different key mappings for easy navigation between splits to save a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
" About nmap and nnoremap: http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
" More natural split opening. Open new split panes to right and bottom, which feels more natural than Vim’s default:
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
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" http://serverfault.com/questions/27917/configure-vim-for-text-selection-with-shift-and-copy-paste-via-ctrlc-ctrlv
" http://vim.cybermirror.org/runtime/mswin.vim
" About vmap and vnoremap: http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
"
" <Leader>x are Cut in visual mode
" vnoremap <S-X>  "+x
 " vnoremap <Leader>x "+x

" <Leader>y are Copy in visual mode
" vnoremap <S-C>  "+y
 " vnoremap <Leader>y "+y

" <Leader>p are Paste in normal mode and command line mode
" noremap <S-V>   "+gp
" cnoremap <S-V>  <C-R>+
 " nnoremap <Leader>p "+p
 " cnoremap <Leader>p <C-R>+
" -----------------------------------

" Statusline and background color
" -----------------------------------
" sachet.com
" 'statusline' 'stl' : When nonempty, this option determines the content of the status line
" 'background' 'bg' : When set to "dark", Vim will try to use colors that look good on a dark background
"                     When set to "light", Vim will try to use colors that look good on a light background
"                     Any other value is illegal
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
"set background=light
set background=dark
" -----------------------------------

" Color schemes
" -----------------------------------
" http://www.vimninjas.com/2012/08/26/10-vim-color-schemes-you-need-to-own/
" :colo[rscheme] {name} : Load color scheme {name}
":silent! colorscheme lucid
:silent! colorscheme desert256
":silent! colorscheme sahara
":silent! colorscheme apprentice
":silent! colorscheme solarized
":silent! colorscheme wombat
":silent! colorscheme grb256
":silent! colorscheme jellybeans
" -----------------------------------

" Hex editing using xxd tool
" -----------------------------------
" http://nion.modprobe.de/blog/archives/628-vim-as-hex-editor.html
 nnoremap <Leader>hexon :%!xxd<CR>
 nnoremap <Leader>hexof :%!xxd -r<CR>
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
" set hidden
" To open a new empty buffer. This replaces :tabnew which I used to bind to this mapping
nnoremap <leader><Leader>bB :enew<CR>
" Move to the next buffer
nnoremap <leader><Leader>bn :bnext<CR>
" Move to the previous buffer
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

" ************************************
" ****** Plugins settings start ******
" ************************************
" NERD_tree
" ==============================================================================
" Open and close the NERD_tree.vim separately                                  " 
 nnoremap <F8> :NERDTreeToggle<CR>
 nnoremap <Leader><leader>nf :NERDTreeFind<CR>
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
 nnoremap <silent> <F9> :TagbarToggle<CR>
 let g:tagbar_ctags_bin = 'ctags'
 let g:tagbar_width = 30
 let g:tagbar_left = 1
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
"  set rtp+=~/.vim/bundle/cscope_maps

" Vim will look for tags file everywhere starting from the current directory up
" to the root. Ref : http://vim.wikia.com/wiki/Autoloading_Cscope_Database
"  set tags=tags;/

"  function! LoadCscope()
    " Searches from the directory of the current file upwards until it finds
    " the file "cscope.out", see :h file-searching for ".;".
"    let db = findfile("cscope.out", ".;")
"    if (!empty(db))
"      let path = strpart(db, 0, match(db, "/cscope.out$"))
"      set nocscopeverbose " suppress 'duplicate connection' error
"      exe "cs add " . db . " " . path
"      set cscopeverbose
"    endif
"  endfunction
"  autocmd BufEnter /* call LoadCscope()
" ==============================================================================

" For GNU GLOBAL (gtags) files
" ==============================================================================
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

" ==============================================================================

" For lightline.vim
" ==============================================================================
set laststatus=2
" ==============================================================================

" NERD Commenter
" ==============================================================================
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

" vim-indent-guides
" ==============================================================================
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
" :nmap <silent> <Leader><Leader>ii <Plug>IndentGuidesToggle
" References:
" https://github.com/yangyangwithgnu/use_vim_as_ide#4.2
" http://foocoder.com/blog/mei-ri-vimcha-jian-suo-jin-xian-shi-vim-indent-guides.html/
" ==============================================================================

" mileszs/ack.vim
" ==============================================================================
" Just like where you use :grep, :grepadd, :lgrep, and :lgrepadd, you can use
" :Ack, :AckAdd, :LAck, and :LAckAdd respectively. (See :help Ack after
" installing, or doc/ack.txt in the repo, for more information.)
"
" Keyboard Shortcuts
" The quickfix results window is augmented with these convenience mappings:
" ?    a quick summary of these keys, repeat to close
" o    to open (same as Enter)
" O    to open and close the quickfix window
" go   to preview file, open but maintain focus on ack.vim results
" t    to open in new tab
" T    to open in new tab without moving to it
" h    to open in horizontal split
" H    to open in horizontal split, keeping focus on the results
" v    to open in vertical split
" gv   to open in vertical split, keeping focus on the results
" q    to close the quickfix window

" let g:ackprg = 'ag --nogroup --nocolor --column'

" The default behavior of :Ack will jump to first result, see below if you
" don't want this.
" nnoremap <Leader><Leader>a :Ack<Space>

" I don't want to jump to the first result automatically.~
"     Use `:Ack!`, with bang. If you want this behavior most of the time, you
"     might like an abbreviation or mapping in your personal config, something
"     like these:
" >
"         cnoreabbrev Ack Ack!
"         nnoremap <Leader>a :Ack!<Space>
" <
"     Most of the `:[L]Ack*` commands support this. Note that this behavior
"     follows the convention of Vim's built-in |:grep| and |:make| commands.
"
" ack pattern to 'quickfix-window'
nnoremap <Leader><Leader>aq :Ack! -i<Space><C-R><C-W>
" nnoremap <Leader><Leader>aq :Ack! --ignore-dir=firmware/G1/Release<Space><C-R><C-W>
" nnoremap <Leader><Leader>aq :Ack! --ignore-dir=firmware/Release<Space><C-R><C-W>

" ack pattern to 'location-list-window'
nnoremap <Leader><Leader>al :LAck! -i<Space><C-R><C-W>
" nnoremap <Leader><Leader>aq :Ack! --ignore-dir=firmware/G1/Release<Space><C-R><C-W>
" nnoremap <Leader><Leader>aq :Ack! --ignore-dir=firmware/Release<Space><C-R><C-W>

" References:
" https://github.com/mileszs/ack.vim
" http://harttle.com/2015/12/21/vim-search.html
" ==============================================================================

" PHP Autocompletion plugins
" ==============================================================================
" enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANTE: :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect

" Phpactor : Keyboard Mappings
" ----------------------------------
" https://phpactor.github.io/phpactor/vim-plugin.html
" Include use statement
nmap <Leader><Leader>pua :call phpactor#UseAdd()<CR>
" Invoke the context menu
nmap <Leader><Leader>pcm :call phpactor#ContextMenu()<CR>
" Invoke the navigation menu
nmap <Leader><Leader>pnv :call phpactor#Navigate()<CR>
" Goto definition of class or class member under the cursor
nmap <Leader><Leader>pgd :call phpactor#GotoDefinition()<CR>
" Show brief information about the symbol under the cursor
nmap <Leader><Leader>pii :call phpactor#Hover()<CR>
" Transform the classes in the current file
nmap <Leader><Leader>ptf :call phpactor#Transform()<CR>
" Generate a new class (replacing the current file)
nmap <Leader><Leader>pcn :call phpactor#ClassNew()<CR>
" Extract expression (normal mode)
nmap <silent><Leader><Leader>pee :call phpactor#ExtractExpression(v:false)<CR>
" Extract expression from selection
vmap <silent><Leader><Leader>pes :<C-U>call phpactor#ExtractExpression(v:true)<CR>
" Extract method from selection
vmap <silent><Leader><Leader>pem :<C-U>call phpactor#ExtractMethod()<CR>
" ----------------------------------

" ==============================================================================
