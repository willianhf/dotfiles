local lspconfig = require'lspconfig'
local utils = require'willian.utils'

-- Global diagnostic config
vim.diagnostic.config({
  underline = { severity_limit = "Error" },
  signs = true,
  update_in_insert = false,
})

-- Show all diagnostics on current line in floating window
utils.key_mapper('n', '<leader>sd', '<cmd>lua vim.diagnostic.open_float({ width = 80, focusable = false, border = "single" })<CR>')

-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
utils.key_mapper('n', '<leader>nd', '<cmd>lua vim.diagnostic.goto_next()<CR>')

-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
utils.key_mapper('n', '<leader>pd', '<cmd>lua vim diagnostic.goto_prev()<CR>')

local function lsp_map(mode, left_side, right_side)
  vim.api.nvim_buf_set_keymap(vim.api.nvim_get_current_buf(), mode, left_side, right_side, { noremap = true, silent = true })
end

local function on_attach(client, bufnr)
  lsp_map('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>')
  lsp_map('n', 'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>')
  lsp_map('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>')
  lsp_map('n', 'gw',         '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  lsp_map('n', 'gW',         '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  lsp_map('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>')
  lsp_map('n', 'gt',         '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  lsp_map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  lsp_map('n', 'K',          '<cmd>lua vim.lsp.buf.hover()<CR>')
  lsp_map('n', '<c-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  lsp_map('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  lsp_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

  -- disable formatting from tsserver
  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local default_config = {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Language Servers
lspconfig.bashls.setup(default_config)
lspconfig.cssls.setup(default_config)
lspconfig.dockerls.setup(default_config)
lspconfig.html.setup(default_config)
lspconfig.jsonls.setup(default_config)
lspconfig.yamlls.setup(default_config)

local nls = require('null-ls')
nls.setup({
  sources = {
    require("null-ls").builtins.formatting.prettierd,
    require("null-ls").builtins.diagnostics.eslint_d,
    require("null-ls").builtins.formatting.prismaFmt
  },
})

local tw_highlight = require('tailwind-highlight')
lspconfig.tailwindcss.setup({
  on_attach = function(client, bufnr)
    tw_highlight.setup(client, bufnr, {
      single_column = false,
      mode = 'background',
      debounce = 200,
    })
  end
})

lspconfig.tsserver.setup(default_config)
