set noerrorbells
set guicursor=
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hidden
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set relativenumber
set nowrap
set noshowmode
set background=dark
set nohlsearch
set scrolloff=8
set signcolumn=yes
set clipboard+=unnamedplus

syntax on

let mapleader = " "

nnoremap <C-s> :w<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
xnoremap > >gv
xnoremap < <gv

nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
