syntax on
filetype indent plugin on
set scrolloff=999
set nu
set autoindent
" typing <TAB> is just four spaces
set expandtab
set tabstop=4

set backspace=indent,eol,start
set shiftwidth=4
set hlsearch
" show line numbers
set number

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
color delek

