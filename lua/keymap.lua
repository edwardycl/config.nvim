vim.g.mapleader = ' '
-- Deal with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move selected lines
vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]])
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]])

-- Keep the cursor at the middle
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste without changing the register
vim.keymap.set('x', '<leader>p', '"_dP')

-- Copy to the system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Format code
vim.keymap.set('n', '<leader>s', vim.lsp.buf.format)

-- Quickfix
vim.keymap.set('n', ']q', '<cmd>cnext<CR>zz', { desc = 'Next [Q]uickfix' })
vim.keymap.set('n', '[q', '<cmd>cprev<CR>zz', { desc = 'Previous [Q]uickfix' })

-- NvimTree
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<CR>')

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', telescope.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>f', telescope.live_grep, { desc = 'Grep' })
vim.keymap.set('n', '<leader><space>', telescope.buffers, { desc = 'List buffers' })
vim.keymap.set('n', '<leader>h', telescope.help_tags, { desc = '[H]elp tags' })
vim.keymap.set('n', '<leader>k', telescope.keymaps, { desc = '[K]eymaps' })
vim.keymap.set('n', '<leader>/', telescope.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })


-- Bufferline
local bufferline = require('bufferline')
vim.keymap.set('n', '<leader>1', function() bufferline.go_to_buffer(1, true) end)
vim.keymap.set('n', '<leader>2', function() bufferline.go_to_buffer(2, true) end)
vim.keymap.set('n', '<leader>3', function() bufferline.go_to_buffer(3, true) end)
vim.keymap.set('n', '<leader>4', function() bufferline.go_to_buffer(4, true) end)
vim.keymap.set('n', '<leader>5', function() bufferline.go_to_buffer(5, true) end)
vim.keymap.set('n', '<leader>6', function() bufferline.go_to_buffer(6, true) end)
vim.keymap.set('n', '<leader>7', function() bufferline.go_to_buffer(7, true) end)
vim.keymap.set('n', '<leader>8', function() bufferline.go_to_buffer(8, true) end)
vim.keymap.set('n', '<leader>9', function() bufferline.go_to_buffer(9, true) end)
vim.keymap.set('n', '<leader>0', function() bufferline.go_to_buffer(10, true) end)
vim.keymap.set('n', '<leader>q', '<cmd>bp|bd #<CR>')
vim.keymap.set('n', ']b', function() bufferline.cycle(1) end, { desc = 'Next [B]uffer' })
vim.keymap.set('n', '[b', function() bufferline.cycle(-1) end, { desc = 'Previous [B]uffer' })

-- Trouble
local trouble = require('trouble')
vim.keymap.set('n', '<leader>tt', '<cmd>TroubleToggle<cr>')
vim.keymap.set('n', '<leader>tw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
vim.keymap.set('n', '<leader>td', '<cmd>TroubleToggle document_diagnostics<cr>')
vim.keymap.set('n', '<leader>tl', '<cmd>TroubleToggle loclist<cr>')
vim.keymap.set('n', '<leader>tq', '<cmd>TroubleToggle quickfix<cr>')
vim.keymap.set('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>')
vim.keymap.set('n', ']t', function() trouble.next({ skip_groups = true, jump = true }) end)
vim.keymap.set('n', '[t', function() trouble.previous({ skip_groups = true, jump = true }) end)
vim.keymap.set('n', ']]t', function() trouble.last({ skip_groups = true, jump = true }) end)
vim.keymap.set('n', '[[t', function() trouble.first({ skip_groups = true, jump = true }) end)

-- Preview diagnostic
vim.keymap.set('n', '<leader>dp', vim.diagnostic.open_float)

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
