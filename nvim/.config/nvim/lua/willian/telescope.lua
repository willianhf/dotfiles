local telescope = require 'telescope'

telescope.setup {
  defaults = {
    file_ignore_patterns = { "%.git/", "node_modules/", "coverage/", "__pycache__/", "%.o" }
  },
  pickers = {
    file_browser = {
      hidden = true,
      disable_devicons = true,
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end
        }
      }
    },
    find_files = {
      hidden = true
    },
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<C-x>"] = "delete_buffer"
        }
      }
    }
  }
}

telescope.load_extension('file_browser')

local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>ps',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end
)

vim.keymap.set('n', '<leader>pw',
  function()
    builtin.live_grep()
  end
)

vim.keymap.set('n', '\\\\',
  function()
    builtin.buffers()
  end
)

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

vim.keymap.set('n', '<leader>pe',
  function()
    telescope.extensions.file_browser.file_browser({
      path = '%:p:h',
      cwd = telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      initial_mode = 'normal',
    })
  end
)
