return {
    -- nvim-autopairs: Automatically close brackets and quotes
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true, -- Enable Treesitter integration
                disable_filetype = { "TelescopePrompt", "vim" }, -- Disable in certain filetypes
            })

            -- Integrate nvim-autopairs with nvim-cmp
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    }
}

