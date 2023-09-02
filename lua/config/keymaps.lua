-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "gh", "^", { silent = true })
vim.keymap.set("n", "gl", "$", { silent = true })

-- Terminal keymaps
vim.keymap.set("t", "<S-Space>", "<Space>")
vim.keymap.set("t", "<S-BS>", "<BS>")
vim.keymap.del("t", "<C-l>")
