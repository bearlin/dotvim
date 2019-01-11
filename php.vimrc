set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mileszs/ack.vim'

Plug 'StanAngeloff/php.vim'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'phpactor/ncm2-phpactor'
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'

Plug 'brafales/vim-desert256'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/L9'
call plug#end()

set encoding=utf-8
set fileencodings=utf-8,cp950,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
set nocompatible
set t_Co=256
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=120
set formatoptions=tcroq
set expandtab
set autoindent
set fileformat=unix
set ruler
set backspace=2
set ignorecase
set smartcase
set hlsearch
set incsearch
set smartindent
set confirm
set history=200
set cursorline
set laststatus=2
set wildmenu
set wildmode=full
set diffopt=filler,vertical
set number
set mouse=a
set splitbelow
set splitright
set list
if has('win32unix')
  set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<
else
  set listchars=eol:↲,tab:▸\ ,trail:·,extends:»,precedes:«
endif
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
set background=dark

let mapleader=","
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

vnoremap <Leader>x "*x
vnoremap <Leader>y "*y
nnoremap <Leader>p "*p
cnoremap <Leader>p <C-R>*

nnoremap j gj
nnoremap k gk

:silent! colorscheme desert256

" NERD_tree
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <Leader><leader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeWinPos="right"
let NERDTreeWinSize=35

" tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_left = 1

" lightline.vim
set laststatus=2

" NERD Commenter
let g:NERDSpaceDelims=1

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" mileszs/ack.vim
nnoremap <Leader><Leader>aq :Ack! -i<Space>--ignore-dir=.git <C-R><C-W>
nnoremap <Leader><Leader>al :LAck! -i<Space>--ignore-dir=.git <C-R><C-W>

" PHP Autocompletion plugins
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

" ncm2-ultisnips settings
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
