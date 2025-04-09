-- Set ANTHROPIC_API_KEY to empty here to avoid avante chat popup for
-- ANTHROPIC_API_KEY in some version
vim.env.ANTHROPIC_API_KEY = ''

return {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false,
    opts = {
        provider = 'openai',
        openai = {
            endpoint = 'https://api.openai.com/v1',
            api_key_name = 'cmd: cat ' .. os.getenv('HOME') .. '/.openai/api.key',
        },
        mappings = {
            ask = '<A-l>',
            edit = '<A-;>',
        },
        behaviour = {
            enable_cursor_planning_mode = true,
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
