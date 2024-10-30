return {
  'Exafunction/codeium.vim',
  config = function ()
    vim.g.codeium_disable_bindings = 1

    vim.keymap.set('i', '\x1bk', function() return vim.fn['codeium#Accept']() end, {expr = true, silent = true})
    vim.keymap.set('i', '\x1bh', function() return vim.fn['codeium#Complete']() end, {expr = true, silent = true})
    vim.keymap.set('i', '\x1bj', function() return vim.fn['codeium#Clear']() end, {expr = true, silent = true})
  end
}
