return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      scope = { show_start = true, show_end = true },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        format = {
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        },
      },
      presets = {
        bottom_search = false,
      },
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    opts = {
      markdown = {
        fat_headlines = false, -- TODO:
        fat_headline_upper_string = "▄",
        fat_headline_lower_string = "▀",
      },
    },
  },
  -- Minimap
  -- {
  --   "echasnovski/mini.map",
  --   event = "BufReadPre",
  --   opts = function()
  --     local map = require("mini.map")
  --     return {
  --       symbols = {
  --         encode = map.gen_encode_symbols.dot("4x2"),
  --       },
  --       integrations = {
  --         map.gen_integration.builtin_search(),
  --         map.gen_integration.gitsigns(),
  --         map.gen_integration.diagnostic(),
  --       },
  --     }
  --   end,
  --   keys = function()
  --     local map = require("mini.map")
  --     return {
  --       { "<leader>mo", map.open, desc = "Minimap Open" },
  --       { "<leader>mc", map.close, desc = "Minimap Close" },
  --       { "<leader>mm", map.toggle, desc = "Minimap Toggle" },
  --       { "<leader>mf", map.toggle_focus, desc = "Minimap Toggle Focus" },
  --     }
  --   end,
  -- },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      if require("lazyvim.util").has("mini.map") then
        opts.defaults["<leader>m"] = { name = "+minimap" }
      end
    end,
  },
  {
    "tzachar/highlight-undo.nvim",
    opts = {
      duration = 300,
      undo = {
        hlgroup = "HighlightUndo",
        mode = "n",
        lhs = "u",
        map = "undo",
        opts = {},
      },
      redo = {
        hlgroup = "HighlightRedo",
        mode = "n",
        lhs = "<C-r>",
        map = "redo",
        opts = {},
      },
      highlight_for_count = true,
    },
  },
}
