-- brackets complement
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<Esc>ko', {})

-- navigation between splited windows
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', {})
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', {})
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', {})
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', {})

-- windows resizing
vim.api.nvim_set_keymap('n', ',', '<C-W><', {})
vim.api.nvim_set_keymap('n', '.', '<C-W>>', {})

-- tabbing
vim.api.nvim_set_keymap('n', 'T', ':tabe<CR>', {})

-- tab rolling
vim.api.nvim_set_keymap('n', '-', 'gT', {})
vim.api.nvim_set_keymap('n', '=', 'gt', {})

-- code tracking
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {})
vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', {})
-- vim.api.nvim_set_keymap('n', 'rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', {})

-- current file vertical splitting
vim.api.nvim_set_keymap('n', '<F2>', ':vsplit<CR>', {})

-- search and replace words
vim.api.nvim_set_keymap('n', '<F3>', '"zyiw:exe " Ag ".@z.""<CR>', {})
vim.api.nvim_set_keymap('n', '<F4>', ':cdo %s///gc <Left><Left><Left><Left><Left>', {})

-- plugin shortcut commands
vim.api.nvim_set_keymap('n', '<F5>', ':lua rgsearch()<CR><CR>', {})
vim.api.nvim_set_keymap('n', '<F6>', ':Files<CR>', {})
vim.api.nvim_set_keymap('n', '<F7>', ':NERDTree<CR>', {})

-- search highlight
vim.api.nvim_set_keymap('n', '<F8>', ':noh<CR>', {})

-- Rg search function
function rgsearch()
    vim.api.nvim_command('let target = input(":Rg ")')
    vim.api.nvim_command('exec "normal mX"')
    vim.api.nvim_command('exec "Rg ". target')
    vim.api.nvim_command('exec "normal mY"')
end
