-- configure encodings
vim.g.encoding = 'UTF-8'
vim.o.fileencoding = 'utf-8'

-- emit true color
vim.opt.termguicolors = true

-- reserve lines when moving cursor
vim.o.scrolloff = 4
vim.o.sidescrolloff = 4

-- confirm before exit
vim.o.confirm = true

-- configure lines wrapping
vim.o.wrap = false
vim.wo.wrap = false

-- enable mouse
vim.o.mouse = 'a'

-- disable swap file
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- enable line number
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

-- configure diagnostic
vim.diagnostic.config(
    {
        virtual_text = false,
        float = { border = 'rounded' },
        underline = {
            severity = {
                min = vim.diagnostic.severity.HINT,
            },
        },
        signs = {
            priority = 10,
            text = {
                [vim.diagnostic.severity.ERROR] = "|",
                [vim.diagnostic.severity.WARN] = "|",
                [vim.diagnostic.severity.INFO] = "|",
                [vim.diagnostic.severity.HINT] = "|"
            }
        }
    }
)
