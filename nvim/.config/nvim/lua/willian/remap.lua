-- save buffer
vim.keymap.set("n", "<C-s>", vim.cmd.w)

-- keep visual mode on identing
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")

-- open netrw explorer
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- merge lines without moving the cursor to the end
vim.keymap.set("n", "J", "mzJ`z")

-- scroll keeping the cursor on middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor on middle on cycling through search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste from system register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to system register
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete copying to void register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- rename the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- keymaps for better default experience
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
