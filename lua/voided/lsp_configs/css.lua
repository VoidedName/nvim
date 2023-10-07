local M_ = {}

function M_.setup(on_attach)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require("lspconfig").cssls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M_
