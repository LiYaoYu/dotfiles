-- setup lazy.nvim
require('lazy').setup(
    {
        spec = {
            { import = 'plugins' },
        },

        -- configure any other settings here
        -- colorscheme that will be used when installing plugins
        install = { colorscheme = { 'habamax' } },

        -- automatically check for plugin updates
        checker = { enabled = false },
    }
)
