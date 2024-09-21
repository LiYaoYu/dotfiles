-- message highlighting
vim.api.nvim_command('hi ModeMsg guibg=none')
vim.api.nvim_command('hi MoreMsg guibg=none')

-- diagnostic highlighting
vim.api.nvim_command('hi SignColumn guibg=none')

-- tabline highlighting
vim.api.nvim_command('hi TabLine guibg=#303030')
vim.api.nvim_command('hi TabLineSel gui=bold guifg=#FFFFFF guibg=#121212')
vim.api.nvim_command('hi TabLineModifiedSel guifg=#FFFFFF guibg=#121212')
vim.api.nvim_command('hi TabLineSeparator guifg=#d4d4d4 guibg=#2d2d2d')
vim.api.nvim_command('hi TabLineSeparatorSel guifg=#d7af00 guibg=#121212')

-- column color highlighting
vim.api.nvim_command('hi ColorColumn guibg=red')
