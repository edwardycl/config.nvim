local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Automatically re-compile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update, { with_sync = true })
    end,
  }

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-telescope/telescope-ui-select.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',

      -- Shows inlay hints
      'simrat39/inlay-hints.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- Better editor experience
  use 'tpope/vim-surround' -- Keymaps for editing surroundings: '', "", (), {}
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use 'tpope/vim-speeddating' -- Use CTRL-A/CTRL-X to increment dates, times, and more
  use 'tpope/vim-repeat' -- Enable repeating supported plugin maps with "."
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'wellle/targets.vim' -- Add various text object selection mappings
  -- use 'mbbill/undotree'

  -- Better UI
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use {
    'akinsho/bufferline.nvim', tag = 'v3.*',
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use 'akinsho/toggleterm.nvim'
  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use 'folke/lsp-colors.nvim'
  use 'folke/todo-comments.nvim'

  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'lewis6991/foldsigns.nvim'

  use 'github/copilot.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
