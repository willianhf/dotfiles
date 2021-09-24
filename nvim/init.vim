source ~/.vimrc

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'cocopon/iceberg.vim'

call plug#end()

colorscheme iceberg

lua << EOF
  local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
      require'lspconfig'[server].setup{}
    end
  end

  setup_servers()

  -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
  require'lspinstall'.post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
  end
EOF

nnoremap <leader>ps :lua require('telescope.builtin').file_browser()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>ph :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>rn :lua require('telescope.builtin').rename()<CR>
nnoremap K :lua require('telescope.builtin').hover()<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>
noremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
