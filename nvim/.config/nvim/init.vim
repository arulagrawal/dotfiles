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

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "go,html,javascript,python"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

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

" coc autocomplete engine
Plug 'neoclide/coc.nvim', {'branch': 'release'} 

Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'farmergreg/vim-lastplace'
" Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
" Plug 'fatih/vim-go'
call plug#end()

let g:coc_global_extensions=['coc-json',
                           \ 'coc-css',
                           \ 'coc-html',
                           \ 'coc-tsserver',
                           \ 'coc-rls',
                           \ 'coc-python',
                           \ 'coc-snippets',
                           \ 'coc-pairs',
                           \ 'coc-yank',
                           \ 'coc-go',
                           \ 'coc-clangd',
                           \ 'coc-tabnine',
                           \ 'coc-yaml' ]

" ****************************************************************
" vim core settings
" ****************************************************************

set nocompatible
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

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
hi Conditional gui=italic
hi SignColumn guibg=none

""lightline
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

let g:ale_linters = {}
highlight Pmenu guibg=0
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
" coc settings
" ****************************************************************

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ********************************************

" ****************************************************************
" python settings
" ****************************************************************

" ****************************************************************
" go settings
" ****************************************************************
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


" ****************************************************************
" cpp settings
" ****************************************************************
" this is a bad hack D:
function FormatCPP()
    let l:lines="all"
    py3f /usr/local/opt/llvm/share/clang/clang-format.py
endfunction
au BufNewFile,BufReadPost,BufRead *.cpp command! Format :call FormatCPP()
"
" ****************************************************************
" shell settings
" ****************************************************************
"let b:is_kornshell=1
autocmd BufNewFile,BufReadPre,BufRead *.sh let is_posix=1
