return {
  {
    "ggandor/leap.nvim",
    enabled = false,
  },
  {
    "ggandor/flit.nvim",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      label = {
        -- show the label after the match
        after = false, ---@type boolean|number[]
        -- show the label before the match
        before = true, ---@type boolean|number[]
        -- Enable this to use rainbow colors to highlight labels
        -- Can be useful for visualizing Treesitter ranges.
        rainbow = {
          enabled = true,
          -- number between 1 and 9
          shade = 5,
        },
      },
      -- You can override the default options for a specific mode.
      -- Use it with `require("flash").jump({mode = "forward"})`
      ---@type table<string, Flash.Config>
      modes = {
        -- options used when flash is activated through
        -- `f`, `F`, `t`, `T`, `;` and `,` motions
        char = {
          enabled = false,
        },
      },
    },
    keys = function()
      return {
        {
          "<C-f>",
          mode = { "n", "o", "x" },
          function()
            require("flash").jump()
          end,
          desc = "Flash",
        },
        {
          "<C-t>",
          mode = { "o", "x" },
          function()
            require("flash").treesitter()
          end,
          desc = "Flash Treesitter",
        },
        {
          "r",
          mode = "o",
          function()
            require("flash").remote()
          end,
          desc = "Remote Flash",
        },
        {
          "R",
          mode = { "o", "x" },
          function()
            require("flash").treesitter_search()
          end,
          desc = "Flash Treesitter Search",
        },
        {
          "<C-s>",
          mode = { "c" },
          function()
            require("flash").toggle()
          end,
          desc = "Toggle Flash Search",
        },
      }
    end,
  },
  -- Modify dates
  { "tpope/vim-speeddating", event = "VeryLazy" },
  -- Close buffers
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<C-q>", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
    },
  },
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      auto_clean_after_session_restore = true,
      popup_border_style = "rounded",
      open_files_do_not_replace_types = { "terminal", "trouble", "qf", "help" },
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem", display_name = "󰉓 Files" },
          { source = "buffers", display_name = " Bufs" },
          { source = "git_status", display_name = "󰊢 Git" },
          { source = "document_symbols", display_name = "󰆧 Syms" },
        },
        show_separator_on_edge = true,
      },
      default_component_configs = {
        icon = {
          folder_empty = "",
          folder_empty_open = "",
        },
        name = {
          highlight_opened_files = true,
        },
        git_status = {
          symbols = {
            renamed = "󰁕",
            unstaged = "󰄱",
          },
        },
        diagnostics = {
          symbols = {
            hint = "",
          },
        },
      },
      window = {
        mappings = {
          ["<C-c>"] = "revert_preview",
          ["t"] = "toggle_node",
          ["Z"] = "expand_all_nodes",
        },
      },
      filesystem = {
        filtered_items = {
          hide_by_name = {
            "node_modules",
          },
          always_show = {
            ".gitignore",
          },
          never_show = {
            ".DS_Store",
          },
        },
        follow_current_file = {
          enabled = true,
        },
      },
      buffers = {
        show_unloaded = true,
        window = {
          mappings = {
            ["D"] = "buffer_delete",
          },
        },
      },
      document_symbols = {
        follow_cursor = true,
        kinds = {
          File = { icon = "󰈙", hl = "Tag" },
          Namespace = { icon = "󰌗", hl = "Include" },
          Package = { icon = "󰏖", hl = "Label" },
          Class = { icon = "󰌗", hl = "Include" },
          Method = { icon = "󰊕", hl = "Function" },
          Property = { icon = "󰆧", hl = "@property" },
          Enum = { icon = "󰒻", hl = "@number" },
          Interface = { icon = "", hl = "Type" },
          Function = { icon = "󰊕", hl = "Function" },
          Constant = { icon = "", hl = "Constant" },
          String = { icon = "󰀬", hl = "String" },
          Number = { icon = "󰎠", hl = "Number" },
          Boolean = { icon = "", hl = "Boolean" },
          Array = { icon = "󰅪", hl = "Type" },
          Object = { icon = "󰅩", hl = "Type" },
          Key = { icon = "󰌋", hl = "" },
          Null = { icon = "", hl = "Constant" },
          Struct = { icon = "󰌗", hl = "Type" },
          Event = { icon = "", hl = "Constant" },
          Operator = { icon = "󰆕", hl = "Operator" },
          TypeParameter = { icon = "", hl = "Type" },
          StaticMethod = { icon = "󰘧", hl = "Function" },
        },
      },
    },
  },
}
