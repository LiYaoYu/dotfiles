-- plugins configurations
local vscode_colors = require('vscode.colors').get_colors()

require('vscode').setup(
    {
        -- enable italic comment
        italic_comments = true,

        -- disable nvim-tree background color
        disable_nvimtree_bg = true,

        -- override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
            vscBack = '',
            vscPopupBack = '#323232',
            vscCursorDarkDark = '#202020',
        },

        -- override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
            Cursor = {
                fg = vscode_colors.vscDarkBlue,
                bg = vscode_colors.vscLightGreen,
                bold=true
            },
            CursorLineNr = {
                bold = true
            },
            PmenuSel = {
                fg = None,
                bg = '#363636'
            },
            TelescopeSelection = {
                fg = vscode_colors.vscFront,
                bg = vscode_colors.vscCursorDarkDark
            },
        }
    }
)

require('vscode').load()

require('lualine').setup(
    {
        options = {
            theme = 'vscode',
            component_separators = {
                left = '|',
                right = '|'
            },
            section_separators = {
                left = '',
                right = ''
            },
        }
    }
)

require('tabline').setup(
    {
        close_icon = '',
        separator = '▌',
    }
)

require('smartcolumn').setup()

require('mason').setup(
    {
        ui = {
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗',
            },
        },
    }
)

require('mason-lspconfig').setup(
    {
        -- check the document below for more mapping informations
        -- williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
        ensure_installed = {
            'bashls',
            'cssls',
            'clangd',
            'html',
            'jsonls',
            'rust_analyzer',
            'ts_ls',
            'marksman',
            'pyright',
            'yamlls',
        },
    }
)

local lspconfig = require('lspconfig')

lspconfig.bashls.setup {}
lspconfig.cssls.setup {}
lspconfig.clangd.setup {}
lspconfig.html.setup {}
lspconfig.jsonls.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.ts_ls.setup {}
lspconfig.marksman.setup {}
lspconfig.pyright.setup {}
lspconfig.yamlls.setup {}

local cmp = require('cmp')

cmp.setup(
    {
        preselect = cmp.PreselectMode.None,

        mapping = {
            ["<CR>"] = cmp.config.disable,
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<C-y>"] = cmp.mapping.confirm()
        },

        sources = {
            { name = "codeium" },
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
            { name = "cmdline" },
        }
    }
)

return require('packer').startup(function(use)
    -- manage packer by itself
    use {
        'wbthomason/packer.nvim'
    }

    -- devicons configuration plugin
    use {
        'nvim-tree/nvim-web-devicons'
    }

    -- color scheme configuration plugin
    use {
        'Mofiqul/vscode.nvim'
    }

    -- bufferline configuration plugin
    use {
        'nvim-lualine/lualine.nvim',
    }

    -- tabline configuration plugin
    use {
        'seblj/nvim-tabline'
    }

    -- indent configuration plugin
    use {
        'lukas-reineke/indent-blankline.nvim'
    }

    -- color column reminder plugin
    use {
        "m4xshen/smartcolumn.nvim"
    }

    -- syntax highlight configuration plugin
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require(
                'nvim-treesitter.install'
            ).update(
                {
                    with_sync = true
                }
            )

            ts_udpate()
        end,
    }

    -- file exploring plugin
    use {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup {}
        end
    }

    -- fuzzy file/code finding plugin
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {
                'nvim-lua/plenary.nvim'
            }
        },
    }

    -- external editor tooling configuration plugins
    use {
        -- external editor tooling manager
        'williamboman/mason.nvim',

        -- mason and lspconfig cooperator
        'williamboman/mason-lspconfig.nvim',

        -- neovim LSP client configurator
        'neovim/nvim-lspconfig',
    }

    -- LSP enhancement plugin
    use ({
        'nvimdev/lspsaga.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('lspsaga').setup({})
        end,
    })

    -- code completing plugins
    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
    }

    -- code completing AI plugin
    use {
        "Exafunction/codeium.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({})
        end
    }
end)
