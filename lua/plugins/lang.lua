return {
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/workspace/personal/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.keybinds"] = {
          config = {
            default_keybinds = false,
          },
        },
      },
    },
    keys = function()
      return {
        {
          "<leader>on",
          mode = { "n" },
          "<Plug>(neorg.dirman.new-note)",
          desc = "Neorg New Note",
        },
      }
    end,
  },
}
