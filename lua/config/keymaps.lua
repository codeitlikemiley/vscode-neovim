-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable Q
vim.keymap.set("n", "Q", "<nop>", { silent = true })
-- Disable Ctrl +Z
vim.keymap.set("n", "<C-z>", "<nop>", { silent = true })
-- Map Ctrl-W to delete the previous word in insert mode.
vim.keymap.set("i", "<C-w>", "<C-\\><C-o>dB", { silent = true })
