return     {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
    require("neo-tree").setup({
        filesystem = {
        filtered_items = {
            visible = true, -- Show hidden files
            hide_dotfiles = false, -- Do not hide dotfiles (like .config)
            hide_gitignored = false, -- Show git-ignored files
        },
        },
    })
    end
}
