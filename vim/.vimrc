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
set background=dark
set nohlsearch
set scrolloff=8
set signcolumn=yes

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#Search#
set statusline+=%{StatuslineGit()}
set statusline+=%#Visual#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %l:%c

set list 
set list!
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=eol:↴
set listchars+=nbsp:_

set undodir=~/.config/nvim/undos
set undofile

syntax on

autocmd BufEnter * :syntax sync fromstart
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! noautocmd w

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

" Copy to system clipboard
xnoremap <leader>y "+y

" Run Prettier
nnoremap <leader>gp :silent %!npx prettier --stdin-filepath %<CR>

" Replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
