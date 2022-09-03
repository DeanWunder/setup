" Disable Coc version plugin
let g:coc_disable_startup_warning = 1

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
call plug#end()

" key mappings example
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

syntax on
filetype indent plugin on
set scrolloff=999
set nu
set autoindent
set smarttab
" typing <TAB> is just four spaces
set expandtab
set tabstop=4

set backspace=indent,eol,start
set shiftwidth=4
set hlsearch
" Ignore case when searching
set ignorecase
" Incremental search that shows partial matches.
set incsearch
" Automatically switch search to case-sensitive when search query contains an uppercase letter.
set smartcase
" show line numbers
set number
" prevent line numbers from being selected
set mouse=a

set nolist

"spaces behave like tabs
set sts=4

"command line
set ls=0
set showcmd

"use system clipboard
set clipboard=unnamedplus

"fix shift+y
map Y y$

"ctrl+l gets rid of search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" stop swapfiles from appearing in working directories.
set swapfile
set dir=/tmp
set runtimepath^=~/.vim/bundle/vim-minisnip
autocmd BufNewFile,BufReadPost *.tpp set filetype=cpp

" Don't update screen during macro and script execution
set lazyredraw

" Disable beeps on errors.
set noerrorbells
" Flash the screen instead of beep on errors.
set visualbell
" Set a window's title, reflecting the file currently being edited.
set title
" Delete comment characters when joining lines.
set formatoptions+=j
" Hide files in the background instead of closing them.
set hidden
" Increase undo limit.
set history=1000
set cursorline
color industry
hi CursorLine cterm=none ctermbg=16
hi CursorLineNR cterm=none ctermbg=16
set signcolumn=no
