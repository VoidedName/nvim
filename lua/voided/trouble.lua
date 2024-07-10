local trouble = require("trouble")

vim.keymap.set("n", "<leader>xx", function() trouble.open("diagnostics") end)
vim.keymap.set("n", "gR", function() trouble.open("lsp_references") end)

