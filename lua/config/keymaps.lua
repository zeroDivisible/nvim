-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<C-G>", "<ESC>", { silent = true })

-- disable ext mode
vim.keymap.set("n", "Q", "<Nop>", { silent = true })
