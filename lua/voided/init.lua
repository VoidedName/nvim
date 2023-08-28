-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("voided.options")
require("voided.keymap")
require("voided.packer")
require("voided.colors")
require("voided.lsp")
require("voided.undotree")
require("voided.telescope")
require("voided.treesitter")
require("voided.indent-blanks")
require("voided.floaterm")
require("voided.lualine")
require("voided.nvim-tree")
require("voided.dap_config")
require("voided.trouble")
