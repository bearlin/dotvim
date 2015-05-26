" //==============================pathogen.vim===============================
execute pathogen#infect()

" //=============================General Settings===============================
" Basic settings
" -----------------------------------
" http://blog.roga.tw/2010/01/%E6%88%91%E7%9B%AE%E5%89%8D%E4%BD%BF%E7%94%A8%E7%9A%84-vimrc-%E8%A8%AD%E5%AE%9A%E6%AA%94/
" 檔案編碼
set encoding=utf-8
set fileencodings=utf-8,cp950
 
" 編輯喜好設定 
syntax on        " 語法上色顯示
set nocompatible " VIM 不使用和 VI 相容的模式
set ai           " 自動縮排
set shiftwidth=2 " 設定縮排寬度 = 2 
set tabstop=2    " tab 的字元數
set softtabstop=2
set expandtab   " 用 space 代替 tab
 
set ruler        " 顯示右下角設定值
set backspace=2  " 在 insert 也可用 backspace
set ic           " 設定搜尋忽略大小寫
set ru           " 第幾行第幾個字
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set smartindent  " 設定 smartindent
set confirm      " 操作過程有衝突時，以明確的文字來詢問
set history=100  " 保留 100 個使用過的指令
set cursorline   " 顯示目前的游標位置
 
set laststatus=2
"set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]
" -----------------------------------

" Enable mouse and line numbering
" -----------------------------------
" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
" http://usevim.com/2012/05/16/mouse/
" http://vimdoc.sourceforge.net/htmldoc/options.html#'mouse' 
" How to copy text when mouse=a: http://stackoverflow.com/questions/4608161/copy-text-out-of-vim-with-set-mouse-a-enabled
set number       " Enable line numbering
"set ttyfast      " Send more characters for redraws

set mouse=a      " Enable mouse use in all modes
"set mouse=n      " Enable mouse use only in normal modes

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
" set ttymouse=xterm
" -----------------------------------

" Change mapleader to ','
" -----------------------------------
" Learn Vimscript the Hard Way - Leaders http://learnvimscriptthehardway.stevelosh.com/chapters/06.html
" http://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file
let mapleader=","
" -----------------------------------

" Easier split window navigations 
" -----------------------------------
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
"
" Easier split navigations 
" We can use different key mappings for easy navigation between splits to save a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural split opening
" Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright
" -----------------------------------

" Show special characters
" -----------------------------------
" http://danawoodman.com/posts/vim-show-whitespace/
" http://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-characters
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"
" Show extra whitespace
set list
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set listchars=eol:$,tab:\|_,trail:.,extends:>,precedes:<
set listchars=eol:↲,tab:▸\ ,trail:·,extends:»,precedes:«
" -----------------------------------

" Easier Cut/Copy/Paste 
" -----------------------------------
" http://serverfault.com/questions/27917/configure-vim-for-text-selection-with-shift-and-copy-paste-via-ctrlc-ctrlv
" http://vim.cybermirror.org/runtime/mswin.vim
"
" SHIFT-X are Cut in visual mode
vmap <S-X>  "+x

" SHIFT-C are Copy in visual mode
vmap <S-C>  "+y

" SHIFT-V are Paste in normal mode and command line mode
map <S-V>   "+gp
cmap <S-V>  <C-R>+
" -----------------------------------

" Statusline and background color
" -----------------------------------
" sachet.com
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
set background=dark
" -----------------------------------

" Color schemes
" -----------------------------------
" http://www.vimninjas.com/2012/08/26/10-vim-color-schemes-you-need-to-own/
colorscheme apprentice 
" colorscheme wombat
" colorscheme grb256 
" colorscheme jellybeans
" -----------------------------------

" Hex editing using xxd tool
" -----------------------------------
" http://nion.modprobe.de/blog/archives/628-vim-as-hex-editor.html
map <Leader>hon :%!xxd<CR>
map <Leader>hof :%!xxd -r<CR>

" Considering adding advanced hex editing plugins in the future:
" http://usevim.com/2012/06/20/vim-binary-files/
" http://vim.wikia.com/wiki/Hex_dump
" http://vim.wikia.com/wiki/Improved_hex_editing
" http://www.vim.org/scripts/script.php?script_id=666
" https://github.com/fidian/hexmode
" -----------------------------------
" //============================================================================

" //============================Plugins settings start============================
" Source Explorer
" -----------------------------------
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
" -----------------------------------

" NERD_tree
" -----------------------------------
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
" -----------------------------------

" Taglist
" -----------------------------------
" Open and close the taglist.vim separately                                    " 
 nmap <silent> <F9> :TlistToggle<CR>
" -----------------------------------

" vim-cpp-enhanced-highlight
" -----------------------------------
" Optional features
" Highlighting of class scope if disabled by default. To enable set
" let g:cpp_class_scope_highlight = 1

" Highlighting of template functions is enabled by setting
" let g:cpp_experimental_template_highlight = 1
" Note: C++ template syntax is notoriously difficult to parse, so don't expect this feature to be perfect."
" -----------------------------------

" DirDiff
" -----------------------------------
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
" -----------------------------------

" pathogen.vim
" -----------------------------------
filetype plugin indent on
" -----------------------------------
" //==============================================================================

