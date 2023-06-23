-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- emit true color
vim.opt.termguicolors = true

-- reserve lines when moving cursor
vim.o.scrolloff = 4
vim.o.sidescrolloff = 4

-- need confirmation before exit
vim.o.confirm = true

-- do not change lines
vim.o.wrap = false
vim.wo.wrap = false

-- enable mouse
vim.o.mouse = 'a'

-- disable to create swp file
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- line number
vim.wo.number = true

-- enable cursor line
vim.wo.cursorline = true

-- handle trailing list
vim.opt.list = true
vim.opt.listchars:append('trail:⋅')
vim.api.nvim_command('hi Whitespace guifg=#ff8282')

-- set tab expanding
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- set tab config specifically for Makefile
vim.api.nvim_exec(
    'au FileType make setlocal ' ..
    'tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab',
    false
)

-- ignore case sensitve when string search
vim.api.nvim_command('set ignorecase')

-- diagnostic config
local signs = { Error = '│', Warn = '│', Hint = '│', Info = '│' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(
    hl,
    {
        text = icon,
        texthl = hl,
        numhl = hl
    }
)
end

-- LSP completion configurations
local cmp = require('cmp')

cmp.setup(
    {
        mapping = {
            ['<C-p>'] = cmp.mapping(
                cmp.mapping.select_prev_item(),
                { 'i', 'c' }
            ),
            ['<C-n>'] = cmp.mapping(
                cmp.mapping.select_next_item(),
                { 'i', 'c' }
            ),
            ['<CR>'] = cmp.mapping.confirm(
                { select = true }
            ),
        },
        formatting = {
            format = function(entry, vim_item)
                -- set a name for each source
                vim_item.menu = (
                    {
                        nvim_lsp = '[LSP]',
                        buffer = '[BUF]',
                    }
                )[entry.source.name]

                return vim_item
            end
        },
        sources = cmp.config.sources(
            {
                {name = 'nvim_lsp'},
            },
            {
                {name = 'buffer'},
            }
        )
    }
)

-- Use buffer source for `/`
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(
    ':', {
        sources = cmp.config.sources(
            {
                { name = 'path' }
            },
            {
                { name = 'cmdline' }
            }
        )
    }
)
