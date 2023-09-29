local _M = {}

function _M.setup(on_attach)
    require("lspconfig").tsserver.setup {
        on_attach = on_attach,
    }
end

return _M
