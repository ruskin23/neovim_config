vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.o.number = true           -- Enable line numbers
vim.o.relativenumber = true   -- Enable relative line numbers
vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.scrolloff = 8

-- Open file in vertical split
vim.keymap.set('n', '<leader>sv', ':vsplit<Space>', { noremap = true, silent = false }) -- `<leader>sv` waits for a file path
vim.keymap.set('n', '<leader>sf', ':vsplit %<CR>', { noremap = true, silent = true })   -- `<leader>sf` opens the current file in a vertical split

-- Open file in horizontal split
vim.keymap.set('n', '<leader>sh', ':split<Space>', { noremap = true, silent = false }) -- `<leader>sh` waits for a file path
vim.keymap.set('n', '<leader>sb', ':split %<CR>', { noremap = true, silent = true })  -- `<leader>sb` opens the current file in a horizontal split

-- If you want simpler split navigation (optional)
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })


-- buffers
vim.api.nvim_set_keymap("n", "tk", ":blast<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tj", ":bfirst<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "th", ":bprev<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tl", ":bnext<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", {noremap=false})

-- Keybinding to clear search highlight manually
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Automatically clear search highlight when entering insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.cmd("nohlsearch")
    end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins", opts)

