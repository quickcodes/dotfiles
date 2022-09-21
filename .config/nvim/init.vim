set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set wildmode=longest,list,full
set encoding=UTF-8

let mapleader=" "

"call plug#begin('~/.config/nvim/plugged')
call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'jerybert/vimagit'
" Plug 'LukeSmithxyz/vimling'
" Plug 'vimwiki/vimwiki'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs' " auto brackets
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview

Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
call plug#end()


" Goyo plugin centre text
map <leader>f :Goyo \| set linebreak<CR>
" SPelling checker
map <leader>o :setlocal spell! spelllang=en_us<CR>
" Shell Checker
map <leader>s :!clear && shellchecker %<CR>
" Auto Delete white space
autocmd BufWritePre * %s/\s\+$//e
" Run commands with pattern of text
" :g/<!-- [A-Z]\+[0-9]/sort
" inoremap Tab <Esc>
" inoremap Tab <Esc>
