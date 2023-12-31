local _M = {}

local this_os = vim.loop.os_uname().sysname
local mason_extensions = vim.fn.stdpath("data")
local netcoredbg

if this_os:find "Windows" then
    netcoredbg = mason_extensions .. "\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg"
else
    netcoredbg = mason_extensions .. "/mason/packages/netcoredbg/netcoredbg/netcoredbg"
end


function _M.setup(on_attach)
    local pid = vim.fn.getpid()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- local capabilities = require("plugins.configs.lspconfig").capabilities
    local lspconfig = require("lspconfig")
    lspconfig.omnisharp.setup {
        on_attach = on_attach,
        capabilities = capabilities,

        -- Enables support for reading code style, naming convention and analyzer
        -- settings from .editorconfig.
        enable_editorconfig_support = true,

        -- If true, MSBuild project system will only load projects for files that
        -- were opened in the editor. This setting is useful for big C# codebases
        -- and allows for faster initialization of code navigation features only
        -- for projects that are relevant to code that is being edited. With this
        -- setting enabled OmniSharp may load fewer projects and may thus display
        -- incomplete reference lists for symbols.
        enable_ms_build_load_projects_on_demand = false,

        -- Enables support for roslyn analyzers, code fixes and rulesets.
        enable_roslyn_analyzers = true,

        -- Specifies whether 'using' directives should be grouped and sorted during
        -- document formatting.
        organize_imports_on_format = false,

        -- Enables support for showing unimported types and unimported extension
        -- methods in completion lists. When committed, the appropriate using
        -- directive will be added at the top of the current file. This option can
        -- have a negative impact on initial completion responsiveness,
        -- particularly for the first few completion sessions after opening a
        -- solution.
        enable_import_completion = true,

        -- Specifies whether to include preview versions of the .NET SDK when
        -- determining which version to use for project loading.
        sdk_include_prereleases = false,

        -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
        -- true
        analyze_open_documents_only = false,
    }
    
    local dap = require('dap')
    -- TODO(voided): make this work
    local is_ok, config = pcall(dofile, vim.fn.getcwd() .. "\\.nvim\\config.lua")
    if is_ok then 
        dap.adapters.coreclr = {
            type = 'executable',
            command = netcoredbg,
            args = {'--interpreter=vscode'}
        }

        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to dll', vim.fn.getcwd() .. config.debug_path, 'file')
                end,
            },
        }
    else
    end
end

return _M
