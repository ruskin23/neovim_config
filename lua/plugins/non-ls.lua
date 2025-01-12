return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local helpers = require("null-ls.helpers")

        -- Your custom flake8 linter for Python
        local flake8_linter = {
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
            filetypes = { "python" },
            generator = helpers.generator_factory({
                command = "flake8",
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
                            E = helpers.diagnostics.severities.error,
                            F = helpers.diagnostics.severities.error,
                            W = helpers.diagnostics.severities.warning,
                        },
                    }
                ),
            }),
        }

        null_ls.setup({
            sources = {
                -- Python tools only
                null_ls.builtins.formatting.black.with({
                    extra_args = { "--fast" }
                }),
                null_ls.builtins.formatting.isort,
                flake8_linter,
                
                -- Lua formatter
                null_ls.builtins.formatting.stylua,
            },
            -- Add debug = false to reduce error messages
            debug = false
        })
    end
}