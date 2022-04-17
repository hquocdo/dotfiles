" Fish doesn't play all that well with others
set shell=/bin/bash
let mapleader="\<Space>"
" Not vi compatible
set nocompatible
" Enable syntax highlighting
syntax on
" Show matching braces
set showmatch

" Plugins
call plug#begin()

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntactic Languague support
Plug 'dag/vim-fish'

call plug#end()
" Plugin settings
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" Deal with colors
set termguicolors
set background=dark
set t_Co=256
colorscheme vim-monokai-tasty

" Force utf-8 encoding
set encoding=utf-8
" Disable startup msg
set shortmess+=I
" Number lines
set nu
" Relative line numbering
set rnu
" Incremental search (as string is being typed)
set incsearch
" Set highlight search
set hls
" smart case-insensitive search
set ignorecase
set smartcase
" Autoindent when starting new line
filetype plugin indent on
set autoindent
" Allow backspace in insert mode
set backspace=indent,eol,start
" Always show status line
set laststatus=2
" Disable error bells
set visualbell noerrorbells t_vb=
" Don't reset cursor to start of line when moving around
set nostartofline
" Show the cursor position
set ruler
" Line break
set lbr
" Show mode in statusbar
set noshowmode

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if has("&undodir")
    set undodir=~/.vim/undo
endif

" use 4 spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Stop search highlighting
vnoremap <c-h> :nohlsearch<cr>
nnoremap <c-h> :nohlsearch<cr>

" Always focus on splited window
set splitright
set splitbelow

" ; as :
map ; :

" Jump to start and end of line using the home row keys
map H ^
map L $

" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick save
nmap <leader>w :w<CR>

" Move by line
nnoremap j gj
nnoremap k gk

" Toggle between buffers
nnoremap <leader><leader> <C-^>

" Strip trailling whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>


" Autocommands
" Jump to last edit position on opening file
if has('autocmd')
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") < line("$") | exe "normal! g'\"" | endif
endif


