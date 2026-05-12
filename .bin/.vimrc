"-----------------------------------
" Basic
"-----------------------------------
set encoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
filetype plugin indent on

"-----------------------------------
" UI
"-----------------------------------
set laststatus=2
set showmode
set showcmd
set ruler
set number
set cursorline

"-----------------------------------
" Indent
"-----------------------------------
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

"-----------------------------------
" Search
"-----------------------------------
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"-----------------------------------
" Mouse
"-----------------------------------
set mouse=a