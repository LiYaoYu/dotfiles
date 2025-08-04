return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
            -- specify parsers to prevent runtime installation delays
            ensure_installed = {
                'lua', 'python', 'rust', 'c', 'cpp', 'bash', 'json', 'yaml',
                'markdown', 'markdown_inline', 'html', 'css', 'javascript',
                'typescript', 'vim', 'vimdoc', 'query'
            },
            highlight = { enable = true },
            auto_install = false,

            -- improve performance for large files
            disable = function(lang, buf)
                local max_filesize = 100 * 1024
                local ok, stats = pcall(
                    vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf)
                )

                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
        }
    end
}
