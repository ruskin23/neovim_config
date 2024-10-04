return {
    -- nvim-autopairs: Automatic closing of brackets and quotes
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end
    },

    -- nvim-cmp integration with nvim-autopairs (optional, for better handling in completion)
    {
        "windwp/nvim-autopairs",
        config = function()
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end
    }
}

