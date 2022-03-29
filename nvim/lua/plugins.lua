-- color config for indent-blankline.nvim and trailing space
vim.opt.list = true
vim.opt.listchars:append('trail:⋅')
vim.highlight.create('Whitespace', {ctermfg = 'red'}, false)
vim.highlight.create('IndentBlanklineChar', {ctermfg = 234}, false)
vim.highlight.create('IndentBlanklineSpaceChar', {ctermfg = 239}, false)

return require('packer').startup(function(use)
    -- manage packer by itself
    use {'wbthomason/packer.nvim'}

    -- indent config
    use {'lukas-reineke/indent-blankline.nvim'}

    -- files/codes fuzzy exploring
    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
    use {'junegunn/fzf.vim'}

    -- files exploring
    use {'scrooloose/nerdtree'}

    -- lsp configurations
    use {'neovim/nvim-lspconfig'}
    use {'williamboman/nvim-lsp-installer'}
    use {'ojroques/nvim-lspfuzzy', requires = {{'junegunn/fzf'}, {'junegunn/fzf.vim'}}}

    -- code completer
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp'}

    -- function parameter hints
    use {'hrsh7th/cmp-nvim-lsp-signature-help'}

    -- snippets
    use {'L3MON4D3/LuaSnip'}
end)
