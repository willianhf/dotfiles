local Plug = require 'willian.vimplug'

Plug.begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'pantharshit00/vim-prisma'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'tpope/vim-surround'
Plug 'numToStr/Comment.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'princejoogie/tailwind-highlight.nvim'
Plug('folke/tokyonight.nvim', {
  branch = 'main',
})
Plug 'simrat39/rust-tools.nvim'

Plug.ends()
