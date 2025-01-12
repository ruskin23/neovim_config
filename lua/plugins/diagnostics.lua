return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            -- Configure diagnostic signs with new syntax
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '✘',
                        [vim.diagnostic.severity.WARN] = '▲',
                        [vim.diagnostic.severity.INFO] = '►',
                        [vim.diagnostic.severity.HINT] = '•'
                    }
                },
                -- Keep your existing severity settings
                severity_sort = true,
                virtual_text = {
                    severity = {
                        min = vim.diagnostic.severity.WARN
                    }
                }
            })
        end
    }
}