return {
    'Mofiqul/vscode.nvim',

    -- Make sure vscode.nvim is loaded as highest priority
    priority = 1000,

    config = function()
        local colors = require('vscode.colors').get_colors()

        require('vscode').setup {
            -- enable italic comment
            italic_comments = true,

            -- disable nvim-tree background color
            disable_nvimtree_bg = true,

            -- override colors (see ./lua/vscode/colors.lua)
            color_overrides = {
                vscBack = '',
                vscPopupBack = '#323232',
                vscCursorDarkDark = '#202020'
            },
        }

        require('vscode').load()
    end
}
