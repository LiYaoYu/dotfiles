return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        require('lualine').setup {
            sections = {
                lualine_c = {
                    {
                        'filename', path = 1
                    }
                },
                lualine_x = {
                    'searchcount', 'encoding', 'fileformat', 'filetype'
                },
            },
            options = {
                theme = 'vscode',
                disabled_filetypes = {'NvimTree'},
                component_separators = {left = '|', right = '|'},
                section_separators = {left = '', right = ''}
            }
        }
    end
}
