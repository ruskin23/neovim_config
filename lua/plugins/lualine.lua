return {
    "nvim-lualine/lualine.nvim",
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- Optional icons
    config = function()
        require('lualine').setup {
            options = {
                theme = 'gruvbox-material', -- Use Gruvbox Material theme
                section_separators = { left = '', right = '' }, -- Separators
                component_separators = { left = '', right = '' }, -- Component separators
                icons_enabled = true, -- Enable icons (if you have 'nvim-web-devicons' installed)
                globalstatus = true, -- Global status line across splits
            },
            sections = {
                lualine_a = { 'mode' }, -- Shows current mode (Normal, Insert, etc.)
                lualine_b = { 'branch', 'diff', 'diagnostics' }, -- Shows Git branch, diff, diagnostics
                lualine_c = { 'filename' }, -- Shows file name
                lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- Shows encoding, file format, and type
                lualine_y = { 'progress' }, -- Shows file progress
                lualine_z = { 'location' } -- Shows cursor location (line/col)
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' }, -- Show file name on inactive windows
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = { 'nvim-tree', 'quickfix' } -- Add extensions like nvim-tree or quickfix if used
        }
    end
}

