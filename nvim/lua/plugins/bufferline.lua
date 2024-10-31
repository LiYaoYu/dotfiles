return {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup {
            options = {
                show_close_icon = false,
                show_buffer_close_icons = false,
                separator_style = { '|', '|' },
                indicator = {
                    icon = ' ▶▶',
                    style = 'icon'
                },
                offsets = {
                    {
                        filetype = 'NvimTree',
                        text = 'NvimTree',
                        text_align = 'center',
                        separator = true,
                        highlight = 'NvimTreeNormal',
                    }
                },
            }

        }

        -- disable bufferline background color
        vim.api.nvim_command('hi BufferLineFill guibg=none')
    end
}
