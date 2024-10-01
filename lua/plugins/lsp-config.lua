return {
    -- Mason: Manages LSP servers, formatters, and linters
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    -- Mason-LSPConfig: Bridges Mason and nvim-lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { 
                    "lua_ls",     -- Lua LSP 
                    "pyright",    -- Python LSP
                    "clangd",     -- C/C++ LSP
                    "rust_analyzer" -- Rust LSP (optional, not installed yet)
                },
            })
        end
    },

    -- nvim-lspconfig: Setup LSPs for Lua, Python, C/C++, and Rust
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Lua LSP
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }, -- Prevent warnings for Neovim-specific globals
                        },
                    },
                },
            })

            -- Python LSP (Pyright)
            lspconfig.pyright.setup({})

            -- C/C++ LSP (Clangd)
            lspconfig.clangd.setup({})

            -- Rust LSP (for future setup, can be commented out for now)
            -- lspconfig.rust_analyzer.setup({})

            -- Global key mappings using LspAttach event for all LSPs
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local opts = { noremap = true, silent = true, buffer = bufnr }

                    -- Key mappings for LSP features
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)               -- Hover documentation
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)         -- Go to definition
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)         -- Find references
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code actions
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)     -- Rename symbol
                    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, opts)     -- Format the current buffer
                end,
            })
        end
    }
}

