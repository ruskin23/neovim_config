vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.o.number = true           -- Enable line numbers
vim.o.relativenumber = true   -- Enable relative line numbers
vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"

-- Additional basic settings
vim.o.termguicolors = true    -- Enable true color support
vim.o.ignorecase = true       -- Case insensitive search
vim.o.smartcase = true        -- Case sensitive search when uppercase is used
vim.o.hlsearch = true         -- Highlight search results
vim.o.incsearch = true        -- Incremental search
vim.o.scrolloff = 8           -- Keep 8 lines above/below cursor
vim.o.sidescrolloff = 8       -- Keep 8 columns left/right of cursor
vim.o.wrap = false            -- Disable line wrapping
vim.o.showmode = false        -- Hide mode display (handled by lualine)
vim.o.cursorline = true       -- Highlight current line
vim.o.signcolumn = "yes"      -- Always show sign column
vim.o.updatetime = 250        -- Faster completion
vim.o.timeoutlen = 300        -- Faster key sequence completion
