return {
    -- Existing plugins...

    -- nvim-cmp: Main autocompletion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            -- LSP source for nvim-cmp
            "hrsh7th/cmp-nvim-lsp",
            -- Buffer completions
            "hrsh7th/cmp-buffer",
            -- Path completions
            "hrsh7th/cmp-path",
            -- Snippet completions
            "saadparwaiz1/cmp_luasnip",
            -- Snippet engine
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")


            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item() -- Select next item in the menu
                        elseif require("luasnip").expand_or_jumpable() then
                            require("luasnip").expand_or_jump() -- Expand snippet or jump to the next snippet placeholder
                        else
                            fallback() -- Fallback to normal Tab behavior if no completion menu
                        end
                    end, { "i", "s" }), -- Works in insert and select modes
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item() -- Select previous item in the menu
                        elseif require("luasnip").jumpable(-1) then
                            require("luasnip").jump(-1) -- Jump to the previous snippet placeholder
                        else
                            fallback() -- Fallback to normal Shift-Tab behavior
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- LSP completion
                    { name = "luasnip" }, -- Snippet completions
                }, {
                    { name = "buffer" }, -- Buffer completions
                    { name = "path" }, -- Path completions
                }),
            })
            end
        },

        -- LuaSnip: Snippet engine (required for nvim-cmp)
        {
            "L3MON4D3/LuaSnip",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load() -- Load snippets from VSCode-style libraries
            end
        },
    }

