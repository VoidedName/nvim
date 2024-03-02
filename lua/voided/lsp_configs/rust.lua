local _M = {}

local this_os = vim.loop.os_uname().sysname
local mason_extensions = vim.fn.stdpath("data")
local codelldb_path
local liblldb_path

if this_os:find "Windows" then
    codelldb_path = mason_extensions .. "\\mason\\packages\\codelldb\\extension\\adapter\\codelldb"
    liblldb_path = mason_extensions .. "\\mason\\packages\\codelldb\\extension\\lldb\\bin\\liblldb.dll"
else
    codelldb_path = mason_extensions .. "/mason/packages/codelldb/extension/adapter/codelldb"
    liblldb_path = mason_extensions .. "/mason/packages/codelldb/extension/lldb/bin/liblldb" .. (this_os == "Linux" and ".so" or ".dylib")
end

require("mason")


function _M.setup(on_attach)
    local rt = require("rust-tools")
    -- Configure LSP through rust-tools.nvim plugin.
    -- rust-tools will configure and enable certain LSP features for us.
    -- See https://github.com/simrat39/rust-tools.nvim#configuration
    local opts = {
        tools = {
            hover_actions = {
                auto_focus = true,
            },
            runnables = {
                use_telescope = true,
            },
            inlay_hints = {
                auto = true,
                show_parameter_hints = true,
                parameter_hints_prefix = " ",
                other_hints_prefix = " ",
            },
        },
        -- all the opts to send to nvim-lspconfio
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
        server = {
            on_attach = function (client, buffnr)
                on_attach(client, buffnr)
                vim.keymap.set("n", "<C-c>", rt.hover_actions.hover_actions, { buffer = buffnr })
                vim.keymap.set("n", "<leader>ga", rt.code_action_group.code_action_group, { buffer = buffnr })
            end,
            settings = {
                -- to enable rust-analyzer settings visit:
                -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
                ["rust-analyzer"] = {
                    -- enable clippy on save
                    checkOnSave = {
                        command = "clippy",
                    },
                    cargo = {
                        -- target = "wasm32-unknown-unknown"
                    }
                },
            },
        },
        dap = { adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path) },
    }


    rt.setup(opts)
end

return _M
