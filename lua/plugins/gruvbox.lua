return {
    -- Gruvbox Material Colorscheme
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
        -- Gruvbox Material settings
        vim.g.gruvbox_material_background = "hard" -- Options: soft, medium, hard
        vim.g.gruvbox_material_foreground = "material" -- Modern palette
        vim.g.gruvbox_material_enable_italic = 1 -- Enable italics
        vim.g.gruvbox_material_enable_bold = 1 -- Enable bold text
        vim.g.gruvbox_material_transparent_background = 1 -- Enable transparency
        vim.g.gruvbox_material_better_performance = 1 -- Optimize for performance
        
        -- Custom highlights for line numbers and status line
        vim.cmd([[
          highlight LineNr guifg=#928374
          highlight CursorLineNr guifg=#fabd2f
          highlight StatusLine guifg=#ebdbb2 guibg=#3c3836
          highlight StatusLineNC guifg=#a89984 guibg=#3c3836
        ]])

        -- Apply the Gruvbox Material colorscheme
        vim.cmd.colorscheme "gruvbox-material"
    end
}

