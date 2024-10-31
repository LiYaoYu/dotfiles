vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#423326', nocombine = true })

return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
        require('ibl').setup {
            indent = {
                char = '│',
                highlight = { 'IndentBlanklineChar' },
            }
        }
    end
}
