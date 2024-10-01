return {
    -- Mason: Manages LSP servers
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
                ensure_installed = { "lua_ls", "pyright", "clangd" }, -- Install Lua, Python, and C/C++ LSPs
            })
        end
    },
    -- nvim-lspconfig: Setup Python and Lua LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- Python LSP (Pyright)
            lspconfig.pyright.setup({
                on_attach = function(client, bufnr)
                    local bufopts = { noremap = true, silent = true, buffer = bufnr }
                    -- Key mappings specific to Python
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
                end,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                        },
                    },
                },
            })
            -- Lua LSP (for Neovim config)
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }, -- Prevent warnings for Neovim-specific globals
                        },
                    },
                },
            })
            -- C/C++ LSP (Clangd)
            lspconfig.clangd.setup({
                on_attach = function(client, bufnr)
                    local bufopts = { noremap = true, silent = true, buffer = bufnr }
                    -- Key mappings specific to C/C++
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
                end,
            })
        end
    }
}

