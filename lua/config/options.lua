-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- Indent
opt.wrap = true
opt.breakindent = true

-- Undo history
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Clipboard
opt.clipboard = ""

vim.filetype.add({
  filename = {
    [".eslintignore"] = "gitignore",
    [".prettierignore"] = "gitignore",
  },
  pattern = {
    [".*%.lalrpop"] = "lalrpop",
  },
})

vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }
