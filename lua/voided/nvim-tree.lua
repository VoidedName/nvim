require("nvim-tree").setup({ })

local api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>ll", function() 
    api.tree.open({ current_window = true, find_file = true })
end, { silent = true })
vim.keymap.set("n", "<leader>ls", function()
    api.tree.toggle({ find_file = true })
end, { silent = true })
