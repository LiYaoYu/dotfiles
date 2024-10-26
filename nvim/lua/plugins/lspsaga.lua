return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        require('lspsaga').setup {
            ui = {
                code_action = ''
            },
            symbol_in_winbar = {
                enable = false
            }
        }

        vim.api.nvim_command('hi NormalFloat guibg=none')
    end
}
