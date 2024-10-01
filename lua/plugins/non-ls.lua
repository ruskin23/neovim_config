return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Lua Formatter
                null_ls.builtins.formatting.stylua,

                -- Python Formatter (using Black)
                null_ls.builtins.formatting.black.with({
                    extra_args = { "--fast" } -- Faster formatting
                }),

                -- C/C++ Formatter (using ClangFormat)
                null_ls.builtins.formatting.clang_format,

                -- Rust Formatter (using RustFmt)
                null_ls.builtins.formatting.rustfmt,
            },
        })
    end
}

