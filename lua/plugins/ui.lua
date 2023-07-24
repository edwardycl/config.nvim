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
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
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
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
███████╗██████╗ ██╗    ██╗ █████╗ ██████╗ ██████╗ ██╗   ██╗ ██████╗██╗     
██╔════╝██╔══██╗██║    ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝██║     
█████╗  ██║  ██║██║ █╗ ██║███████║██████╔╝██║  ██║ ╚████╔╝ ██║     ██║     
██╔══╝  ██║  ██║██║███╗██║██╔══██║██╔══██╗██║  ██║  ╚██╔╝  ██║     ██║     
███████╗██████╔╝╚███╔███╔╝██║  ██║██║  ██║██████╔╝   ██║   ╚██████╗███████╗
╚══════╝╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝    ╚═╝    ╚═════╝╚══════╝
  ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
  },
  -- Minimap
  {
    "echasnovski/mini.map",
    event = "BufReadPre",
    opts = function()
      local map = require("mini.map")
      return {
        symbols = {
          encode = map.gen_encode_symbols.dot("4x2"),
        },
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.gitsigns(),
          map.gen_integration.diagnostic(),
        },
      }
    end,
    keys = function()
      local map = require("mini.map")
      return {
        { "<leader>mo", map.open, desc = "Minimap Open" },
        { "<leader>mc", map.close, desc = "Minimap Close" },
        { "<leader>mm", map.toggle, desc = "Minimap Toggle" },
        { "<leader>mf", map.toggle_focus, desc = "Minimap Toggle Focus" },
      }
    end,
  },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      if require("lazyvim.util").has("mini.map") then
        opts.defaults["<leader>m"] = { name = "+minimap" }
      end
    end,
  },
  -- TODO: Statuscol
  -- {
  --   "luukvbaal/statuscol.nvim",
  --   event = "BufReadPre",
  --   config = function()
  --     local builtin = require("statuscol.builtin")
  --     require("statuscol").setup({
  --       relculright = true,
  --       segments = {
  --         { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  --         {
  --           sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
  --           click = "v:lua.ScSa",
  --         },
  --         { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
  --         {
  --           sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
  --           click = "v:lua.ScSa",
  --         },
  --       },
  --     })
  --   end,
  -- },
}
