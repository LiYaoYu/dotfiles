return {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false,
    opts = {
        provider = 'claude',
        claude = {
            endpoint = 'https://api.anthropic.com',
            model = 'claude-3-5-haiku-20241022',
            api_key_name = 'cmd: cat ' .. os.getenv('HOME') .. '/.anthropic/api.key',
        },
        mappings = {
            ask = '<A-l>',
            edit = '<A-;>',
        },
        behaviour = {
            enable_cursor_planning_mode = true,
            enable_token_counting = false,  -- This take lots of time
        },
    },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'stevearc/dressing.nvim',
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons',
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { 'markdown', 'Avante' },
            },
            ft = { 'markdown', 'Avante' },
        },
    },
}
