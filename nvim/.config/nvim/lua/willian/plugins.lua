vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use "neovim/nvim-lspconfig"
  use "kabouzeid/nvim-lspinstall"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "airblade/vim-gitgutter"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/vim-vsnip"
  use "jose-elias-alvarez/null-ls.nvim"
  use "tpope/vim-surround"
  use "numToStr/Comment.nvim"
  use "onsails/lspkind.nvim"
  use "simrat39/rust-tools.nvim"
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
      require("catppuccin").setup()
      vim.api.nvim_command "colorscheme catppuccin"
    end
  }
end)
