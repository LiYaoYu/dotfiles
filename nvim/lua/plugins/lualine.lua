return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local codeium_cache = {
            status = nil,
            last_update = 0,
        }

        local function codeiumStatus()
            local now = vim.loop.hrtime()
            local cache_duration = 1000000000 -- 1 second in nanoseconds

            -- return cached status if still valid
            if now - codeium_cache.last_update < cache_duration and codeium_cache.status then
                return 'Codeium: ' .. codeium_cache.status
            end

            -- use vim.schedule to make the status check asynchronous
            vim.schedule(function()
                local ok, status = pcall(vim.fn['codeium#GetStatusString'])

                if ok then
                    if status ~= codeium_cache.status then
                        codeium_cache.status = status
                        codeium_cache.last_update = now
                        vim.g.codeium_status = status
                        require('lualine').refresh()
                    end
                end
            end)

            return 'Codeium: ' .. (codeium_cache.status or 'Loading...')
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
