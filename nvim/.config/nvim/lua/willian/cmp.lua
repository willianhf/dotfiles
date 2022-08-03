local utils = require'willian.utils'
local cmp = require'cmp'

vim.o.completeopt = 'menuone,noselect'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- vsnip
vim.g.vsnip_filetypes = {
  javascriptreact = {'javascript'},
  typescriptreact = {'typescript'},
}

local keyopts = { expr = true, noremap = false }
utils.key_mapper('i', '<C-j>', 'vsnip#jumpable(1)  ? "\\<Plug>(vsnip-jump-next)" : "\\<Tab>"', keyopts)
utils.key_mapper('s', '<C-j>', 'vsnip#jumpable(1)  ? "\\<Plug>(vsnip-jump-next)" : "\\<Tab>"', keyopts)
utils.key_mapper('i', '<C-k>', 'vsnip#jumpable(-1) ? "\\<Plug>(vsnip-jump-prev)" : "\\<S-Tab>"', keyopts)
utils.key_mapper('s', '<C-k>', 'vsnip#jumpable(-1) ? "\\<Plug>(vsnip-jump-prev)" : "\\<S-Tab>"', keyopts)

-- Setup nvim-cmp
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },

  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5 },
  },

  formatting = {
    format = function(entry, item)
      item.menu = ({
        nvim_lsp = '[lsp]',
        vsnip = '[vsnip]',
        path = '[path]',
        buffer = '[buffer]',
      })[entry.source.name]

      return item
    end,
  },
}
