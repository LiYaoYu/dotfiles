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

-- code tracking (use Telescope for getting definition, since Lspsaga
-- goto_definition does not support tagstack)
-- note that the Telescope tagstack (for lsp_definitions) and the
-- Lspsaga tagstack share the same tagstack
vim.api.nvim_set_keymap('n', 'gd', ':Telescope lsp_definitions<CR>', {})
vim.api.nvim_set_keymap('n', 'gc', ':Telescope lsp_incoming_calls<CR>', {})
vim.api.nvim_set_keymap('n', 'gr', ':Telescope lsp_references<CR>', {})
vim.api.nvim_set_keymap('n', 'gp', ':Lspsaga peek_definition<CR>', {})
vim.api.nvim_set_keymap('n', 'rn', ':Lspsaga rename ++project<CR>', {})
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc ++keep<CR>', {})

-- current file vertical splitting
vim.api.nvim_set_keymap('n', '<F2>', ':vsplit<CR>', {})

-- explorer files/keywords
vim.keymap.set('n', '<F3>', ':Telescope grep_string<CR>')
vim.keymap.set('n', '<F4>', ':cdo %s///gc <Left><Left><Left><Left><Left>')
vim.keymap.set('n', '<F5>', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<F6>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<F7>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<F12>', ':Lspsaga outline<CR>')
