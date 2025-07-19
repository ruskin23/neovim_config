return {
  {
      -- Telescope
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
          require("telescope").setup {
              defaults = {
                  -- Arguments for live_grep (ripgrep)
                  vimgrep_arguments = {
                      "rg",                      -- Use ripgrep for searching
                      "--color=never",           -- Disable color in results
                      "--no-heading",            -- Don't show file headers
                      "--with-filename",         -- Show filenames in results
                      "--line-number",           -- Show line numbers
                      "--column",                -- Show column numbers
                      "--smart-case",            -- Case-insensitive unless uppercase is used
                      "--fixed-strings"          -- Treat input as literal (no regex)
                  },
                  mappings = {
                  },
                  path_display = { "truncate" },  -- Display truncated file paths
                  file_ignore_patterns = {        -- Ignore unnecessary files
                      "%.git/", "node_modules/", "%.lock", "__pycache__/"
                  },
              },
              pickers = {
                  find_files = {
                      hidden = true,             -- Include hidden files in results
                  },
              },
              extensions = {
                  ["ui-select"] = {
                      require("telescope.themes").get_dropdown {},
                  },
              },
          }
          require("telescope").load_extension("ui-select")

          -- Telescope keymaps
          vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
          vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
          vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
          vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })
          vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
      end
  },
  {
      -- UI Select Extension for Telescope
      "nvim-telescope/telescope-ui-select.nvim",
  }
}
