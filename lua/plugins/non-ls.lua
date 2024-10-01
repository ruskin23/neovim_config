return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local helpers = require("null-ls.helpers")

        -- Custom flake8 linter as an external command
        local flake8_linter = {
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
            filetypes = { "python" },
            generator = helpers.generator_factory({
                command = "flake8", -- Now that it's in your $PATH, use "flake8"
                args = { "--max-line-length=79", "--stdin-display-name", "$FILENAME", "-" },
                to_stdin = true,
                from_stderr = true,
                format = "line",
                check_exit_code = function(code)
                    return code <= 1
                end,
                on_output = helpers.diagnostics.from_pattern(
                    [[(%d+):(%d+): ([EFW])(%d+) (.+)]],
                    { "row", "col", "severity", "code", "message" },
                    {
                        severities = {
                            E = helpers.diagnostics.severities.error,   -- Error (E)
                            F = helpers.diagnostics.severities.error,   -- Fatal error (F)
                            W = helpers.diagnostics.severities.warning, -- Warning (W)
                        },
                    }
                ),
            }),
        }

        null_ls.setup({
            sources = {
                -- Lua Formatter
                null_ls.builtins.formatting.stylua,

                -- Python Formatter (Black)
                null_ls.builtins.formatting.black.with({
                    extra_args = { "--fast" }
                }),

                -- Python Import Sorter (isort)
                null_ls.builtins.formatting.isort,

                -- C/C++ Formatter (ClangFormat)
                null_ls.builtins.formatting.clang_format,

                -- Custom flake8 linter
                flake8_linter,

                -- C/C++ Linter (cppcheck)
                null_ls.builtins.diagnostics.cppcheck,

                -- Rust Formatter and Linter (commented out for now)
                -- null_ls.builtins.formatting.rustfmt,
                -- null_ls.builtins.diagnostics.rust_clippy,
            },
        })
    end
}

