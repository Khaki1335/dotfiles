let mapleader = "\<Space>"

inoremap <silent> jj <Esc>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set autoread
set clipboard+=unnamed
set encoding=utf-8
set expandtab
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set hlsearch
set ignorecase
set incsearch
set list
set number
set relativenumber
set shiftwidth=2
set smartcase
set tabstop=2
syntax on

call plug#begin("~/.local/vim/pugged")
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
call plug#end()
