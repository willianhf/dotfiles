source ~/.vimrc

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'pantharshit00/vim-prisma'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'tpope/vim-surround'
Plug 'cocopon/iceberg.vim'
Plug 'numToStr/Comment.nvim'
Plug 'joshdick/onedark.vim'

call plug#end()

let g:selected_colorscheme = "onedark"
fun! ApplyColorscheme()
  set background=dark
  let g:onedark_termcolors=16

  if has('nvim')
    call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:selected_colorscheme])
  else
    colorscheme onedark
  endif
endfun
call ApplyColorscheme()

nnoremap <leader>cmp :call ApplyColorscheme()<CR>
nnoremap <leader>vwb :let g:selected_colorscheme =

" LSP
lua <<EOF
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
      require'lspconfig'[server].setup{
        on_attach = on_attach,
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
      }
    end
  end

  setup_servers()

  -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
  require'lspinstall'.post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
  end
EOF

" Treesitter
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true
    }
  }
EOF

" cmp
set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua <<EOF
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, 
      { name = 'buffer', keyword_length = 5 },
    },
    experimental = {
      native_menu = true,
    },
  })
EOF

" Telescope
lua <<EOF
  require("telescope").setup {
    defaults = {
      disable_devicons = true
    },
    pickers = {
      buffers = {
        sort_lastused = true,
        mappings = {
          i = {
            ["<c-x>"] = "delete_buffer"
          }
        }
      }
    }
  }
EOF

nnoremap <leader>ps :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pe :lua require('telescope.builtin').file_browser()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').live_grep()<CR>
nnoremap <silent>\\ :lua require('telescope.builtin').buffers()<CR>

" Comment
lua <<EOF
  local comment_ft = require "Comment.ft"

  comment_ft.set("lua", { "--%s", "--[[%s]]" })

  require('Comment').setup {
    ignore = nil,

    -- LHS of operator-pending mapping in NORMAL + VISUAL mode
    opleader = {
      -- line-comment keymap
      line = "gc",
      -- block-comment keymap
      block = "gb",
    },

    -- Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
    mappings = {
      -- operator-pending mapping
      -- Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
      basic = true,

      -- extra mapping
      -- Includes `gco`, `gcO`, `gcA`
      extra = true,

      -- extended mapping
      -- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
      extended = false,
    },

    -- LHS of toggle mapping in NORMAL + VISUAL mode
    -- @type table
    toggler = {
      -- line-comment keymap
      line = "gcc",

      -- block-comment keymap
      block = "gbc",
    },

    -- Pre-hook, called before commenting the line
    -- pre_hook = pre_hook,

    -- Post-hook, called after commenting is done
    post_hook = nil,
  }
EOF
