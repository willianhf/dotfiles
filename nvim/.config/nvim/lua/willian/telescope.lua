local telescope = require'telescope'
local utils = require'willian.utils'

telescope.setup {
  defaults = {
    file_ignore_patterns = { "%.git/", "node_modules/", "coverage/", "__pycache__/", "%.o" }
  },
  pickers = {
    file_browser = {
      hidden = true,
      disable_devicons = true,
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

utils.key_mapper('n', '<leader>ps', ':lua require "telescope.builtin".find_files()<CR>')
utils.key_mapper('n', '<leader>pe', ':lua require "telescope.builtin".file_browser({ cwd = require"telescope.utils".buffer_dir() })<CR>')
utils.key_mapper('n', '<leader>pw', ':lua require "telescope.builtin".live_grep()<CR>')
utils.key_mapper('n', '<leader>ph', ':lua require "telescope.builtin".help_tags()<CR>')
utils.key_mapper('n', '\\', ':lua require "telescope.builtin".buffers()<CR>')
