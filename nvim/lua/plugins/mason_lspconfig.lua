return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
    },
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
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local common_config = {
            capabilities = capabilities,
        }

        lspconfig.bashls.setup(common_config)
        lspconfig.clangd.setup(common_config)
        lspconfig.jsonls.setup(common_config)
        lspconfig.rust_analyzer.setup(common_config)
        lspconfig.pyright.setup(common_config)

        -- lua LSP with specific settings
        lspconfig.lua_ls.setup(vim.tbl_deep_extend('force', common_config, {
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    diagnostics = { globals = { 'vim' } },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file('', true),
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                },
            },
        }))
    end
}
