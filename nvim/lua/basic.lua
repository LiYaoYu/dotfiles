-- change the comfirmation color
vim.o.background = "dark"

-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- reserve lines when moving cursor
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- remain indent
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

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

-- enable cursor line config
vim.wo.cursorline = true

-- enable line number with colors
vim.highlight.create('LineNr', {cterm=bold, ctermfg=242}, false)
vim.api.nvim_command('hi CursorLineNR cterm=bold ctermfg=Green')

-- highlight current cursor line
vim.api.nvim_command('hi CursorLine cterm=none ctermbg=234')

-- set 110 characters reminder
vim.api.nvim_command('let &colorcolumn=join(range(111,999),",")')
vim.api.nvim_command('hi ColorColumn ctermbg=232')

-- set tab expanding
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- set tab config specifically for Makefile
vim.api.nvim_exec('au FileType make setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab', false)

-- modify popup menu color
vim.api.nvim_command('hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE')
vim.api.nvim_command('hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE')

-- modify window separator
vim.api.nvim_command('set fillchars=vert:\\|')
vim.api.nvim_command(':hi VertSplit ctermbg=NONE guibg=NONE cterm=none ctermfg=236')
vim.api.nvim_exec('au ColorScheme * hl VertSplit ctermbg=NONE guibg=NONE cterm=none ctermfg=236', false)

-- disable inlined diagnostic
vim.diagnostic.disable()
