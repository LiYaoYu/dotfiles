return {
    'yetone/avante.nvim', tag = 'v0.0.21',
    version = false,
    opts = {
        provider = "openai",
        openai = {
            endpoint = "https://api.openai.com/v1",
            model = "o3-mini",
            api_key_name = 'cmd: cat ' .. os.getenv('HOME') .. '/.openai/api.key'
        },
        mappings = {
            ask = '<A-l>',
            edit = '<A-;>'
        },
    },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'stevearc/dressing.nvim',
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons',
        {
            'HakonHarnes/img-clip.nvim',
            event = 'VeryLazy',
        },
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { 'markdown', 'Avante' },
            },
            ft = { 'markdown', 'Avante' },
        },
    },
}
