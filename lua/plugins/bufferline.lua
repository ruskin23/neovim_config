return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup{
            options = {
                mode = "buffers",
                separator_style = "thin",  -- Changed from "slant" to "thin"
                always_show_bufferline = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                color_icons = true,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = false  -- Changed from true to false
                    }
                }
            }
        }
        -- Update the buffer close keymap
        vim.keymap.set('n', '<leader>w', function()
            -- If there are multiple buffers, switch to the next one before closing
            local buffers = vim.fn.getbufinfo({buflisted = true})
            if #buffers > 1 then
                vim.cmd('BufferLineCycleNext')
                vim.cmd('bd #')  -- Close the previous buffer
            else
                vim.cmd('bd')    -- Close the current buffer if it's the last one
            end
        end, { noremap = true, silent = true })
    end
}