return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        local function codeiumStatus()
            return 'Codeium:' .. vim.api.nvim_call_function('codeium#GetStatusString', {})
        end

        require('lualine').setup {
            sections = {
                lualine_c = {
                    { 'filename', path = 1 }
                },
                lualine_x = {
                    codeiumStatus, 'searchcount', 'encoding', 'fileformat', 'filetype'
                },
            },
            options = {
                theme = 'vscode',
                globalstatus = true,
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' }
            }
        }
    end
}
