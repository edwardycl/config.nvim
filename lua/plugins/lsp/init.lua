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
              rustfmt = {
                extraArgs = { "+nightly" },
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
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {},
    },
  },
}
