-- complete brackets
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<Esc>ko', {silent = true})

-- navigate between splited windows
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', {silent = true})

-- resize windows
vim.api.nvim_set_keymap('n', ',', '<C-W><', {silent = true})
vim.api.nvim_set_keymap('n', '.', '<C-W>>', {silent = true})

-- tab
vim.api.nvim_set_keymap('n', 'T', ':tabe<CR>', {silent = true})

-- roll tabs
vim.api.nvim_set_keymap('n', '-', 'gT', {silent = true})
vim.api.nvim_set_keymap('n', '=', 'gt', {silent = true})

-- roll buffers
vim.api.nvim_set_keymap('n', '{', ':bprev<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '}', ':bnext<CR>', {silent = true})

-- close current buffer
vim.api.nvim_set_keymap('n', 'q', ':bd<CR>', {silent = true})

-- navigate code
vim.api.nvim_set_keymap('n', 'gd', ':FzfLua lsp_definitions<CR>', {silent = true})
vim.api.nvim_set_keymap('n', 'gc', ':FzfLua lsp_incoming_calls<CR>', {silent = true})
vim.api.nvim_set_keymap('n', 'gr', ':FzfLua lsp_references<CR>', {silent = true})
vim.api.nvim_set_keymap('n', 'gp', ':Lspsaga peek_definition<CR>', {silent = true})
vim.api.nvim_set_keymap('n', 'rn', ':Lspsaga rename ++project<CR>', {silent = true})
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc ++keep<CR>', {silent = true})

-- diagnostic
vim.api.nvim_set_keymap('n', 'L', ':lua vim.diagnostic.open_float()<CR>', {silent = true})

-- split current file in vertical
vim.api.nvim_set_keymap('n', '<F1>', ':split<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<F2>', ':vsplit<CR>', {silent = true})

-- explore files/keywords
vim.api.nvim_set_keymap('n', '<F3>', ':FzfLua grep_cword<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<F4>', ':Spectre<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<F5>', ':FzfLua live_grep<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<F6>', ':FzfLua files<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<F7>', ':NvimTreeFindFileToggle<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<F8>', ':Lspsaga outline<CR>', {silent = true})
