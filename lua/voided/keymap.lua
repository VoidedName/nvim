vim.g.maplocalleader = " "
vim.g.mapleader = " "

local map = vim.keymap.set

-- go back to file exploration
map("n", "<leader>ll", vim.cmd.Ex)
map("n", "<leader>ls", ":Lex 15<CR>")

-- insert move block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- dont put pasted over content into buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- dont put deleted into register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- keep centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

