return {
    'Exafunction/codeium.vim',
    config = function ()
        vim.g.codeium_disable_bindings = 1
        vim.keymap.set('i', '<A-k>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    end
}
