-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.api.nvim_set_keymap
local options = {
  noremap = true,
  silent = true,
}

-- Disable arrow keys in normal mode with echo messages
map("n", "<Up>", ':echoe "Use k"<CR>', options)
map("n", "<Down>", ':echoe "Use j"<CR>', options)
map("n", "<Left>", ':echoe "Use h"<CR>', options)
map("n", "<Right>", ':echoe "Use l"<CR>', options)

-- Disable arrow keys in insert mode with echo messages
map("i", "<Up>", '<ESC>:echoe "Use k"<CR>', options)
map("i", "<Down>", '<ESC>:echoe "Use j"<CR>', options)
map("i", "<Left>", '<ESC>:echoe "Use h"<CR>', options)
map("i", "<Right>", '<ESC>:echoe "Use l"<CR>', options)

-- Disable arrow keys in visual mode with echo messages
map("v", "<Up>", ':echoe "Use k"<CR>', options)
map("v", "<Down>", ':echoe "Use j"<CR>', options)
map("v", "<Left>", ':echoe "Use h"<CR>', options)
map("v", "<Right>", ':echoe "Use l"<CR>', options)

map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", options)
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", options)
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", options)
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", options)
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", options)
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", options)
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", options)
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", options)
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", options)
map("n", "<leader>0", ":BufferLineGoToBuffer -1<CR>", options) -- Go to last buffer

map("n", "<leader>n", ":BufferLineCycleNext<CR>", options)
map("n", "<leader>p", ":BufferLineCyclePrev<CR>", options)
map("n", "<leader>c", ":bdelete<CR>", options) -- Close current buffer
