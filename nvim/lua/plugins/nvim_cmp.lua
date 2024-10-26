return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
    },
    config = function()
        local cmp = require('cmp')

        cmp.setup {
            mapping = {
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
            },
            sources = cmp.config.sources(
                {
                    {name = 'nvim_lsp'},
                    {name = 'buffer'},
                    {name = 'path'},
                }
            ),
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered(
                    {
                        winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
                    }
                ),
            },
            formatting = {
                format = function(entry, vim_item)
                    -- set a name for each source
                    vim_item.menu = (
                    {
                        nvim_lsp = '[LSP]',
                        buffer = '[BUF]',
                        path= '[PAT]',
                    }
                    )[entry.source.name]

                    return vim_item
                end
            },
        }

        -- '/' cmdline setup.
        cmp.setup.cmdline(
            '/',
            {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            }
        )

        -- ':' cmdline setup.
        cmp.setup.cmdline(
            ':',
            {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources(
                    {
                        {name = 'path'},
                        {name = 'buffer'}
                    },
                    {
                        {
                            name = 'cmdline',
                            option = {ignore_cmds = {'Man', '!'}}
                        }
                    }
                )
            }
        )
    end
}
