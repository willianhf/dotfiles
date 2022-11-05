set noerrorbells
set guicursor=
set ignorecase
set noswapfile
set nobackup
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
set nowrap
set noshowmode
set nohlsearch
set scrolloff=8
set signcolumn=yes

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ? ' '.l:branchname.' ' : ''
endfunction

let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set statusline=
set statusline+=%#Visual#
set statusline+=\ %{toupper(g:currentmode[mode()])}\ 
set statusline+=%#Search#
set statusline+=%{StatuslineGit()}
set statusline+=%#Visual#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\%l:%c

set list 
set listchars=tab:»\ ,nbsp:␣,trail:·,extends:<,precedes:>,conceal:┊
set showbreak=↪\

set undodir=~/.config/nvim/undos
set undofile

let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_localcopydircmd = 'cp -r'

nnoremap <SPACE> <Nop>

let mapleader = "\<Space>"

nnoremap <C-s> :w<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
xnoremap > >gv
xnoremap < <gv
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

" Copy to system clipboard
xnoremap <leader>y "*y

" Paste from system clipboard
xnoremap <leader>p "*p

syntax on
set termguicolors
