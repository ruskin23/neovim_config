
-- file
vim.keymap.set('n', '<leader>w', ' :w<CR>', { noremap = true }) -- save with <leader>w

-- Open file in vertical split
vim.keymap.set('n', '<leader>sv', ':vsplit<Space>', { noremap = true, silent = false }) -- `<leader>sv` waits for a file path
vim.keymap.set('n', '<leader>sf', ':vsplit %<CR>', { noremap = true, silent = true })   -- `<leader>sf` opens the current file in a vertical split

-- Open file in horizontal split
vim.keymap.set('n', '<leader>sh', ':split<Space>', { noremap = true, silent = false }) -- `<leader>sh` waits for a file path
vim.keymap.set('n', '<leader>sb', ':split %<CR>', { noremap = true, silent = true })  -- `<leader>sb` opens the current file in a horizontal split

-- Close all other panes
vim.keymap.set('n', '<leader>o', '<C-w>o', { noremap = true, silent = true }) 

-- If you want simpler split navigation (optional)
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Resize panes
vim.keymap.set('n', '<leader>+', ':resize +2<CR>', { noremap = true, silent = true })  -- Increase height
vim.keymap.set('n', '<leader>-', ':resize -2<CR>', { noremap = true, silent = true })  -- Decrease height
vim.keymap.set('n', '<leader>>', ':vertical resize +2<CR>', { noremap = true, silent = true }) -- Increase width
vim.keymap.set('n', '<leader><', ':vertical resize -2<CR>', { noremap = true, silent = true }) -- Decrease width

-- Alternative resize mappings (more reliable)
vim.keymap.set('n', '<leader>rh', ':resize +2<CR>', { noremap = true, silent = true })  -- Increase height
vim.keymap.set('n', '<leader>rl', ':resize -2<CR>', { noremap = true, silent = true })  -- Decrease height
vim.keymap.set('n', '<leader>rw', ':vertical resize +2<CR>', { noremap = true, silent = true }) -- Increase width
vim.keymap.set('n', '<leader>rn', ':vertical resize -2<CR>', { noremap = true, silent = true }) -- Decrease width

-- Keymaps for opening terminals
vim.keymap.set('n', '<leader>tb', ':belowright split | terminal<CR> | i', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tr', ':vertical belowright split | terminal<CR> | i', { noremap = true, silent = true })

-- Swap files between panes
vim.keymap.set('n', '<leader>sw', function()
  -- Get the filenames of the current and alternate buffers
  local current_file = vim.fn.expand('%')
  local alternate_file = vim.fn.expand('#')

  -- If both files are valid, switch them
  if current_file ~= '' and alternate_file ~= '' then
      vim.cmd('b#')         -- Switch to the alternate file
      vim.cmd('wincmd p')   -- Move to the other pane
      vim.cmd('b ' .. current_file)  -- Switch to the original file in the other pane
  else
      print('No alternate file to swap with!')
  end
end, { noremap = true, silent = true })


-- buffers
vim.api.nvim_set_keymap("n", "<leader>bf", ":bfirst<enter>", {noremap=true, silent=true})  -- first buffer
vim.api.nvim_set_keymap("n", "<leader>bl", ":blast<enter>", {noremap=true, silent=true})  -- last buffer
vim.api.nvim_set_keymap("n", "<leader>bp", ":bprev<enter>", {noremap=true, silent=true})  -- previous buffer
vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<enter>", {noremap=true, silent=true})  -- next buffer
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<enter>", {noremap=true, silent=true}) -- delete buffer

-- Keybinding to clear search highlight manually
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Automatically clear search highlight when entering insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.cmd("nohlsearch")
    end,
})
