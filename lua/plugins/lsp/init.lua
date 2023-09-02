return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        virtual_text = {
          prefix = "icons",
        },
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        clangd = {},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
              },
              cargo = {
                buildScripts = {
                  enable = true,
                },
              },
              procMacro = {
                enable = true,
              },
              rustc = {
                source = "discover",
              },
              workspace = {
                symbol = {
                  search = {
                    scope = "workspace_and_dependencies",
                  },
                },
              },
            },
          },
        },
        tsserver = {},
        pyright = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        solidity = {},
        html = {},
        cssls = {},
        jsonls = {},
        yamlls = {},
        bashls = {},
        dockerls = {},
        svelte = {},
        tailwindcss = {},
      },
    },
  },
  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.black,
          nls.builtins.formatting.rustfmt,
        },
      }
    end,
  },
}
