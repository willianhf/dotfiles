local lspconfig = require'lspconfig'

-- Code action popup
-- but only use it if installed
local success_lsputils, lsputils_codeAction = pcall(require, 'lsputil.codeAction')
if success_lsputils then
  if vim.fn.has('nvim-0.6') == 1 then
    vim.lsp.handlers['textDocument/codeAction'] = lsputils_codeAction.code_action_handler
  else
    vim.lsp.handlers['textDocument/codeAction'] = function(_, _, actions)
      lsputils_codeAction.code_action_handler(nil, actions, nil, nil, nil)
    end
  end
end

local function lsp_map(mode, left_side, right_side)
  vim.api.nvim_buf_set_keymap(vim.api.nvim_get_current_buf(), mode, left_side, right_side, { noremap = true })
end

local function on_attach(client, bufnr)
  lsp_map('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>')
  lsp_map('n', 'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>')
  lsp_map('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>')
  lsp_map('n', 'gw',         '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  lsp_map('n', 'gW',         '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  lsp_map('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>')
  lsp_map('n', 'gt',         '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  lsp_map('n', '<leader>p', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  lsp_map('n', 'K',          '<cmd>lua vim.lsp.buf.hover()<CR>')
  lsp_map('n', '<c-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  lsp_map('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  lsp_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

  local diag_opts = '{ width = 80, focusable = false, border = "single" }'
  lsp_map(
    'n',
    '<leader>e',
    string.format('<cmd>lua vim.diagnostic.open_float(%d, %s)<CR>', bufnr, diag_opts)
  )

  -- disable formatting from tsserver
  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Only load cmp lsp capabilities when avaiabled
-- in case you uninstall nvim-cmp
local success_cmp_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if success_cmp_lsp then
  capabilities = require 'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

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
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.prettier,
    require("null-ls").builtins.diagnostics.eslint_d,
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
