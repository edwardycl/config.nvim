return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      label = {
        -- show the label after the match
        after = true, ---@type boolean|number[]
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
  -- Better increment/decrement
  {
    "monaqa/dial.nvim",
    opts = function(_, opts)
      local augend = require("dial.augend")

      local group_ext = {
        markdown = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
        },
      }
      for group, augends in pairs(group_ext) do
        for _, aug in ipairs(augends) do
          table.insert(opts.groups[group], aug)
        end
      end

      return opts
    end,
  },
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
    -- dependencies = {
    --   "3rd/image.nvim",
    -- },
    opts = {
      auto_clean_after_session_restore = true,
      popup_border_style = "rounded",
      open_files_do_not_replace_types = { "terminal", "trouble", "qf", "help" },
      sources = { "filesystem", "buffers", "document_symbols" },
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem", display_name = " 󰉓 Files " },
          { source = "buffers", display_name = " 󰈚 Buffers " },
          { source = "document_symbols", display_name = "  Symbols " },
        },
      },
      default_component_configs = {
        icon = {
          folder_empty = "",
        },
        name = {
          highlight_opened_files = true,
        },
      },
      window = {
        mappings = {
          ["t"] = "toggle_node",
          ["Z"] = "expand_all_nodes",
          ["<C-c>"] = "revert_preview",
          -- ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        },
      },
      filesystem = {
        filtered_items = {
          hide_by_name = {
            "node_modules",
          },
          always_show = {
            ".gitignore",
            ".github",
            ".streamlit",
          },
          never_show = {
            ".DS_Store",
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
      buffers = {
        show_unloaded = true,
        window = {
          mappings = {
            ["<C-q>"] = "buffer_delete",
          },
        },
      },
      document_symbols = {
        follow_cursor = true,
      },
      event_handlers = {
        {
          event = "neo_tree_popup_input_ready",
          ---@param args { bufnr: integer, winid: integer }
          handler = function(args)
            -- vim.cmd("stopinsert")
            vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
          end,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        preview = {
          mime_hook = function(filepath, bufnr, opts)
            local is_image = function(fp)
              local image_extensions =
                { "bmp", "exr", "gif", "hdr", "ico", "jpg", "jpeg", "pbm", "png", "tiff", "webp" }
              local split_path = vim.split(fp:lower(), ".", { plain = true })
              local extension = split_path[#split_path]
              return vim.tbl_contains(image_extensions, extension)
            end
            if is_image(filepath) then
              local term = vim.api.nvim_open_term(bufnr, {})
              local function send_output(_, data, _)
                for _, d in ipairs(data) do
                  vim.api.nvim_chan_send(term, d .. "\r\n")
                end
              end
              vim.fn.jobstart({
                "chafa",
                "--animate",
                "off",
                filepath,
              }, {
                on_stdout = send_output,
                stdout_buffered = true,
              })
            else
              require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
            end
          end,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    config = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("media_files")
      end)
    end,
  },
}
