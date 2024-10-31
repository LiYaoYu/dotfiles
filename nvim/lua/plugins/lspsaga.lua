return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        require('lspsaga').setup {
            ui = { code_action = '' },
            show_outline = { win_position = 'right' }
        }
        vim.api.nvim_command('hi NormalFloat guibg=none')
    end
}
