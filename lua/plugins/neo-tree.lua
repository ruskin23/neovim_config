return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- Toggle Neo-tree
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
        -- Focus on Neo-tree
        -- vim.keymap.set('n', '<C-Left>', ':Neotree focus<CR>', { noremap = true, silent = true })
        -- Move to next window (e.g., back to the file buffer)
        -- vim.keymap.set('n', '<C-Right>', ':wincmd w<CR>', { noremap = true, silent = true })
        -- Close Neo-tree
        vim.keymap.set('n', '<C-c>', ':Neotree close<CR>', { noremap = true, silent = true })

        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        })
    end
}