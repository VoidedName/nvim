function ColorMyPencils(colors)
    local color = colors or "gruvbox"
    local is_ok, _ = pcall(vim.cmd, "colorscheme " .. color)
    if not is_ok then
        vim.notify('colorscheme ' .. color .. ' not found!')
        return
    end

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
