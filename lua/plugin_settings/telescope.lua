local telescope = require('telescope')
local actions = require('telescope.actions')
local trouble = require('trouble.providers.telescope')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-k>'] = actions.move_selection_previous, -- move to prev result
        ['<C-j>'] = actions.move_selection_next,     -- move to next result
        ['<C-t>'] = trouble.open_with_trouble,
      },
      n = {
        ['<C-t>'] = trouble.open_with_trouble,
      },
    },
    winblend = 20,
    dynamic_preview_title = true,
  },
  pickers = {
    find_files = {
      theme = 'dropdown'
    },
    buffers = {
      theme = 'dropdown'
    },
    current_buffer_fuzzy_find = {
      theme = 'dropdown'
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_cursor {},
    }
  },
}
require('telescope').load_extension('ui-select')
