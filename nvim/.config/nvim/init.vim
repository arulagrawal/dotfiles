"
"                                     ██
"                                    ░░
"  ███████   █████   ██████  ██    ██ ██ ██████████
" ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
"  ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
"  ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
"  ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
" ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░


" ****************************************************************
" Vim-Plug auto install
" ****************************************************************
set nocompatible
filetype plugin on
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
" ****************************************************************
" Vim-Plug plugin loading
" ****************************************************************

call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'easymotion/vim-easymotion'
Plug 'Raimondi/delimitMate'

Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'farmergreg/vim-lastplace'
"Plug 'sheerun/vim-polyglot'
let g:go_code_completion_enabled = 0
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" LSP Stuff
" Async.vim
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
" 
call plug#end()

" ****************************************************************
" vim core settings
" ****************************************************************

set nocompatible
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Map leader to ,
let mapleader=','

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set clipboard=unnamedplus

" ****************************************************************
" visuals
" ****************************************************************

syntax on
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
set ruler
set number

set signcolumn=auto
highlight SignColumn ctermbg=none
let g:goyo_linenr=0

let no_buffers_menu=1
set mouse=a
set mousemodel=popup
set t_Co=256
" hide end of file
hi EndOfBuffer guifg=0

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set termguicolors
colorscheme nord
" hi Normal guibg=none
" hi NonText guibg=none
" hi LineNr guifg=60
hi LineNr guibg=none
""split stuff
""hide end of buffer ~
hi EndOfBuffer ctermfg=black ctermbg=black
""""bold
hi Comment gui=bold
hi Conditional cterm=italic
hi SignColumn guibg=none

""lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',      
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
set noshowmode


highlight Pmenu guibg=0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
"highlight PmenuSel guibg=1 guifg='#ff5c57'
"highlight PmenuSbar guibg=1

" git gutter stuff
highlight GitGutterAdd guibg=0
highlight GitGutterChange guibg=0
highlight GitGutterDelete guibg=0

" coc.nvim color settings
"highlight CocErrorHighlight guifg='#ff5c57'
"highlight CocErrorSign guifg='#ff5c57'
"highlight CocHighlightText guibg='#4c566a'



" ****************************************************************
" abbreviations
" ****************************************************************

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


" ****************************************************************
" autocmd rules
" ****************************************************************

" save cursor
"au VimLeave * set guicursor=a:ver25-blinkon0
" add f9 keybind to run python file
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>


" ****************************************************************
" keybinds
" ****************************************************************

" goyo
noremap <Leader>gg :Goyo<CR>

" copy
vmap <C-c> "+y
imap <C-c> "+yi

" Cut
vmap <C-x> "+ci

" Paste
vmap <C-v> <ESC>"+pi
imap <C-v> <ESC>"+pi

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" remove search highlights on escape
noremap <silent><esc> <esc>:noh<CR><esc>

" buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

" Close buffer
noremap <leader>c :bd<CR>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" ****************************************************************
" asyncomplete settings
" ****************************************************************
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_highlight_enabled = 0

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" ****************************************************************
" shell settings
" ****************************************************************
"let b:is_kornshell=1
autocmd BufNewFile,BufReadPre,BufRead *.sh let is_posix=1



let g:go_list_type = "quickfix"
let g:go_fmt_command = "go fmt"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_extra_types = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
