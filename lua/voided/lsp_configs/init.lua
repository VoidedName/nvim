local _M = {}

function _M.setup(on_attach)
    require("voided.lsp_configs.lua").setup(on_attach)
    require("voided.lsp_configs.rust").setup(on_attach)
    require("voided.lsp_configs.csharp").setup(on_attach)
    require("voided.lsp_configs.ts").setup(on_attach)
    require("voided.lsp_configs.css").setup(on_attach)
end

return _M
