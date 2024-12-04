return {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false,
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
    config = function()
        require('avante_lib').load()
        require('avante').setup {
            provider = 'openai',
            mappings = {
                ask = '<A-l>',
                edit = '<A-;>'
            },
            openai = {
                api_key_name = 'cmd: cat ' .. os.getenv('HOME') .. '/.openai/api.key'
            },
        }
    end
}
