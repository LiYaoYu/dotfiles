-- TODO: highlight search modification
-- TODO: tab configurations

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

-- modify popup menu color
vim.api.nvim_command('hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE')
vim.api.nvim_command('hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE')

-- disable inlined diagnostic
vim.diagnostic.disable()

-- enable diagnostic in quickfix if exists when saving files
vim.api.nvim_exec([[
    au BufWritePre * lua diagdisplay()
]], false)

-- Diagnostic display function
function diagdisplay()
    local num = 0
    local diag = vim.diagnostic.get()

    if ((#diag) ~= 0) then
        vim.diagnostic.setqflist()

        -- enable statueline applied to quickfix
        vim.api.nvim_exec('windo setlocal statusline=%!v:lua.statuslinedisplay()', false)
    else
        vim.api.nvim_exec('ccl', false)
    end
end
