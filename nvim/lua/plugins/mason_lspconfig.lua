return {
    'williamboman/mason-lspconfig.nvim',
    config = function()
        require('mason-lspconfig').setup {
            ensure_installed = {
                'bashls',
                'clangd',
                'jsonls',
                'rust_analyzer',
                'pyright',
                'lua_ls'
            }
        }

        local lspconfig = require('lspconfig')

        lspconfig.bashls.setup {}
        lspconfig.clangd.setup {}
        lspconfig.jsonls.setup {}
        lspconfig.rust_analyzer.setup {}
        lspconfig.pyright.setup {}
        lspconfig.lua_ls.setup {}
    end
}
