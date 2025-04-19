return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local last_status = nil

        local function codeiumStatus()
            -- Use vim.schedule to make the status check asynchronous
            vim.schedule(function()
                local ok, status = pcall(vim.fn['codeium#GetStatusString'])

                if ok and status ~= last_status then
                    last_status = status
                    vim.g.codeium_status = status

                    require('lualine').refresh()
                end
            end)

            return 'Codeium: ' .. (last_status or 'Loading...')
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
