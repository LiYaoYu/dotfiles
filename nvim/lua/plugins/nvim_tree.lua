local function disable_dash_key(bufnr)
    local api = require 'nvim-tree.api'

    api.config.mappings.default_on_attach(bufnr)

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', '-', '', opts('Up'))
end

return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        require('nvim-tree').setup {
            on_attach = disable_dash_key
        }
    end
}
