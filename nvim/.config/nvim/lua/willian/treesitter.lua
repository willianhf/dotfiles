require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'css',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'tsx',
    'typescript'
  },
  highlight = { enable = true },
}
