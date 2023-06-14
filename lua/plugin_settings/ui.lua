-- File explorer
require('nvim-tree').setup {
  disable_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  sync_root_with_cwd = true,
  update_focused_file = { enable = true },
  diagnostics = { enable = true },
  modified = { enable = true },
  select_prompts = true,
  view = {
    width = 35,
    relativenumber = true,
    mappings = {
      -- TODO
    }
  },
  renderer = {
    full_name = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      glyphs = {
        bookmark = ""
      }
    }
  },
  actions = {
    expand_all = {
      exclude = { '.git', 'target', 'build', 'node_modules' }
    },
  },
  tab = {
    sync = {
      open = true,
      close = true,
    },
  },
}

local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
    -- open the tree
    require("nvim-tree.api").tree.open()
  end
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

-- Status line
require('lualine').setup {
  options = {
    section_separators = '',
    component_separators = '|',
    disabled_filetypes = {
      statusline = { 'NvimTree', 'toggleterm' },
      winbar = { 'NvimTree', 'toggleterm' }
    },
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
}

-- Show buffers
require('bufferline').setup {
  options = {
    mode = 'buffers',
    numbers = 'ordinal',
    diagnostics = 'nvim_lsp',
    buffer_close_icon = '',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        separator = true,
      }
    },
  },
}

require('trouble').setup {
  height = 15,
  mode = 'document_diagnostics',
}

-- Terminal
require('toggleterm').setup {
  size = 20,
  open_mapping = '<C-`>',
  direction = 'float',
  float_opts = {
    border = 'curved',
    winblend = 30,
  },
}

-- Git signs & blames
local gitsigns = require('gitsigns')
gitsigns.setup {
  current_line_blame = true,
  trouble = true,
  signs = {
    add = { text = '▌' },
    change = { text = '▌' },
    untracked = { text = '┇' },
  },
  preview_config = {
    border = 'rounded',
  },
  on_attach = function(bufnr)
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']g', function()
      if vim.wo.diff then return ']g' end
      vim.schedule(function() gitsigns.next_hunk({ preview = true }) end)
      return '<Ignore>'
    end, { expr = true, desc = 'Next hunk' })

    map('n', '[g', function()
      if vim.wo.diff then return '[g' end
      vim.schedule(function() gitsigns.prev_hunk({ preview = true }) end)
      return '<Ignore>'
    end, { expr = true, desc = 'Previous hunk' })

    -- Actions
    map('n', '<leader>gq', gitsigns.setqflist, { desc = 'Send hunks to the quickfix list' })
    map({ 'n', 'v' }, '<leader>gs', ':Gitsigns stage_hunk<CR>', { desc = 'Stage hunk' })
    map({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset hunk' })
    map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
    map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
    map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Undo stage hunk' })
    map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
    map('n', '<leader>gb', function() gitsigns.blame_line { full = true } end, { desc = 'Git blame' })
    map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Git diff' })
    map('n', '<leader>gD', function() gitsigns.diffthis('~') end, { desc = 'Show diff of the last commit' })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

require('foldsigns').setup {}

require('lsp-colors').setup()

require('todo-comments').setup()

-- Indent guidelines
require('indent_blankline').setup {
  char = '▏',
  show_trailing_blankline_indent = false,
  use_treesitter = true,
  show_current_context = true,
}

-- Comment using `gc`
require('Comment').setup()
