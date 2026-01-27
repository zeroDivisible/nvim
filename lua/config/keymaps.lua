-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "<C-G>", "<ESC>", { silent = true })

-- disable Ex mode (Q in Neovim replays last macro by default, which is useful)
vim.keymap.set("n", "gQ", "<Nop>", { silent = true, desc = "Disable Ex mode" })

-- buffer navigation (vim tab-like bindings)
vim.keymap.set("n", "gt", ":bnext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "gT", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })

-- clipboard (Cmd key mappings for GUI nvim)
vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
vim.keymap.set("v", "<D-c>", '"+y') -- Copy
vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
vim.keymap.set("t", "<D-v>", "<C-R>+") -- Paste terminal mode
