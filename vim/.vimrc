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
set listchars=tab:»\ ,eol:↴,nbsp:␣,trail:·,extends:<,precedes:>,conceal:┊
set showbreak=↪\

set undodir=~/.config/nvim/undos
set undofile

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

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme desert
