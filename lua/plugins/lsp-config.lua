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
                    "rust_analyzer", -- Rust LSP (optional, not installed yet)
                    "ts_ls" -- the js server
                },
            })
        end
    },

    -- nvim-lspconfig: Setup LSPs for Lua, Python, C/C++, and Rust
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- General capabilities to enable autocompletion via nvim-cmp
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

            -- Lua LSP
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }, -- Prevent warnings for Neovim-specific globals
                        },
                    },
                },
                capabilities = capabilities,
            })

            -- Python LSP (Pyright)
            lspconfig.pyright.setup({
                settings = {
                    python = {
                        analysis = {
                            diagnosticSeverityOverrides = {
                                -- Core unused warnings
                                reportUnusedVariable = "none",
                                reportUnusedFunction = "none",
                                reportUnusedImport = "none",
                                reportMissingImports = "none",
                                reportUndefinedVariable = "warning"
                            },
                            typeCheckingMode = "off",
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace"
                        }
                    }
                },
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    vim.diagnostic.config({
                        virtual_text = {
                            severity = {
                                min = vim.diagnostic.severity.WARN
                            }
                        },
                        severity_sort = true
                    })
                end
            })




        -- C/C++ LSP (Clangd)
        lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--background-index",  -- Index project in background for faster searching
                "--suggest-missing-includes",  -- Suggest header includes
                "--clang-tidy",  -- Enable clang-tidy lints
                "--header-insertion=iwyu"  -- Insert headers when necessary
            },
            -- Apply same diagnostic filtering as Python
            on_attach = function(client, bufnr)
                vim.diagnostic.config({
                    virtual_text = {
                        severity = {
                            min = vim.diagnostic.severity.WARN
                        }
                    },
                    severity_sort = true
                })
            end
        })

        
            -- Rust LSP (for future setup, can be commented out for now)
            -- lspconfig.rust_analyzer.setup({
            --    capabilities = capabilities,
            -- })

        -- JavaScript/TypeScript LSP
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                vim.diagnostic.config({
                    virtual_text = {
                        severity = {
                            min = vim.diagnostic.severity.WARN
                        }
                    },
                    severity_sort = true
                })
            end
        })

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
