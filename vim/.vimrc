set noerrorbells
set smartcase
set noswapfile
set nobackup
set incsearch
set hidden
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set autoindent
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

syntax on

filetype plugin on

let mapleader = " "
nnoremap <C-w> :w<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

nmap <leader>o o<Esc>
nmap <leader>O O<Esc>
