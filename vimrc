let g:coc_disable_startup_warning = 1

call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jwalton512/vim-brade'
    Plug 'neomake/neomake'
    Plug 'adoy/vim-php-refactoring-toolbox'
    Plug 'tobyS/pdv'
    Plug 'mhinz/vim-signify'
    Plug 'nrocco/vim-phplint'
    Plug 'phpstan/vim-phpstan'
call plug#end()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:phpstan_analyse_level = 4

" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)
let g:neomake_open_list = 2

set updatetime=100
set signcolumn=yes
highlight clear SignColumn

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
hi CursorLine cterm=none ctermbg=234
hi CursorLineNR cterm=none ctermbg=234
hi Normal ctermbg=232

" Don't crowd git diffs by inserting \n at end of file.
set nofixendofline

autocmd BufNewFile,BufRead *.blade.php set ft=html " Fix blade auto-indent

" Move entire line up or down by pressing <c-s-up> or <c-s-down>
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>

cabb W w
cabb N n
cabb Q q
cabb Wq wq
cabb WQ wq
cabb wQ wq
cabb Wn wn
cabb WN wn
cabb wN wn

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

let g:jellybeans_overrides = {
\    'background': { 'guibg': '000000' },
\}
color jellybeans

let g:PHP_noArrowMatching = 1

" Highlight trailing whitespace
:highlight ExtraWhitespace ctermbg=grey guibg=blue
:match ExtraWhitespace /\s\+$/
