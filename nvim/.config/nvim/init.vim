call plug#begin()

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'yggdroot/indentline'

call plug#end()

"go back to prev spot in file
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


let g:deoplete#enable_at_startup = 1
let g:dracula_colorterm = 0
color dracula
" let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_term = 6

" syntastic settings - recommended 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set nocompatible
filetype on
set background=dark
set t_Co=16
set mouse=a
set number
syntax on
set ruler
filetype plugin on
filetype indent on
set history=500
set showmatch
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set encoding=utf8
set ffs=unix,dos,mac
" use spaces instead of tabs
" set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set laststatus=2
"copy
vmap <C-c> "+y
imap <C-c> "+yi

" Cut
vmap <C-x> "+ci

" Paste
vmap <C-v> <ESC>"+pi
imap <C-v> <ESC>"+pi
