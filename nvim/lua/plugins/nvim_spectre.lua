return {
    'nvim-pack/nvim-spectre',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require('spectre').setup {
            mapping = {
                ['run_current_replace'] = {
                    map = 'rc'
                },
                ['run_replace'] = {
                    map = 'ra'
                }
            }
        }
    end
}
