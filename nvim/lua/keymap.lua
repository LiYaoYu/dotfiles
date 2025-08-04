-- complete brackets
vim.keymap.set('i', '{<CR>', '{<CR>}<Esc>ko', { silent = true, desc = 'Auto-complete brackets with newline' })

-- navigate between splited windows
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { silent = true, desc = 'Move to window below' })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { silent = true, desc = 'Move to window above' })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { silent = true, desc = 'Move to right window' })
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { silent = true, desc = 'Move to left window' })

-- resize windows
vim.keymap.set('n', ',', '<C-W><', { silent = true, desc = 'Decrease window width' })
vim.keymap.set('n', '.', '<C-W>>', { silent = true, desc = 'Increase window width' })

-- tab management
vim.keymap.set('n', 'T', ':tabe<CR>', { silent = true, desc = 'New tab' })

-- roll tabs
vim.keymap.set('n', '-', 'gT', { silent = true, desc = 'Previous tab' })
vim.keymap.set('n', '=', 'gt', { silent = true, desc = 'Next tab' })

-- roll buffers
vim.keymap.set('n', '{', ':bprev<CR>', { silent = true, desc = 'Previous buffer' })
vim.keymap.set('n', '}', ':bnext<CR>', { silent = true, desc = 'Next buffer' })

-- close current buffer
vim.keymap.set('n', 'q', ':bd<CR>', { silent = true, desc = 'Close buffer' })

-- LSP navigation
vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>', { silent = true, desc = 'Go to definition' })
vim.keymap.set('n', 'gc', ':Telescope lsp_incoming_calls<CR>', { silent = true, desc = 'Show incoming calls' })
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', { silent = true, desc = 'Show references' })
vim.keymap.set('n', 'gp', ':Lspsaga peek_definition<CR>', { silent = true, desc = 'Peek definition' })
vim.keymap.set('n', 'rn', ':Lspsaga rename ++project<CR>', { silent = true, desc = 'Rename symbol project-wide' })
vim.keymap.set('n', 'K', ':Lspsaga hover_doc ++keep<CR>', { silent = true, desc = 'Show hover documentation' })

-- diagnostic
vim.keymap.set('n', 'L', vim.diagnostic.open_float, { silent = true, desc = 'Show diagnostic float' })

-- split current file
vim.keymap.set('n', '<F1>', ':split<CR>', { silent = true, desc = 'Horizontal split' })
vim.keymap.set('n', '<F2>', ':vsplit<CR>', { silent = true, desc = 'Vertical split' })

-- file and text exploration
vim.keymap.set('n', '<F3>', ':Telescope grep_string<CR>', { silent = true, desc = 'Search word under cursor' })
vim.keymap.set('n', '<F4>', ':Spectre<CR>', { silent = true, desc = 'Find and replace' })
vim.keymap.set('n', '<F5>', ':Telescope live_grep<CR>', { silent = true, desc = 'Live grep' })
vim.keymap.set('n', '<F6>', ':Telescope find_files<CR>', { silent = true, desc = 'Find files' })
vim.keymap.set('n', '<F7>', ':NvimTreeFindFileToggle<CR>', { silent = true, desc = 'Toggle file tree' })
vim.keymap.set('n', '<F8>', ':Lspsaga outline<CR>', { silent = true, desc = 'Show outline' })
