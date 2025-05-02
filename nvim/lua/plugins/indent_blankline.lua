vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#423326', nocombine = true })

return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
        require('ibl').setup {
            scope = {
                enabled = false
            },
            indent = {
                char = '│',
                highlight = 'IblIndent', -- Updated highlight group name
            }
        }
    end
}
