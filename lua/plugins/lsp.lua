return {
    -- Mason
    {
        'williamboman/mason.nvim',
        config = function()
            require("mason").setup()
        end
    },
    -- Mason-lspconfig
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"pyright", "ruff", "lua_ls", "ts_ls"}
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
            {'williamboman/mason.nvim'},
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } }
                    }
                }
            })

            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })

            vim.lsp.config("ruff", {
                capabilities = capabilities,
            })

            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
            })

            vim.lsp.enable({"lua_ls", "pyright", "ruff", "ts_ls"})

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

            vim.diagnostic.config({
                update_in_insert = true,
                virtual_text = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "✘",
                        [vim.diagnostic.severity.WARN] = "▲",
                        [vim.diagnostic.severity.HINT] = "⚑",
                        [vim.diagnostic.severity.INFO] = "»",
                    },
                },
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end
    },
}

