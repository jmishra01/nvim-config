-- Autocommand that reloads neovim whenever you save the plugins.lua filepack
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost packages.lua source <afile> | PackerSync
	augroup end
]]

local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end
  }
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- ColorTheme
  use 'Mofiqul/vscode.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'EdenEast/nightfox.nvim'
  use 'sainnhe/gruvbox-material'
  use 'sainnhe/everforest'
  use 'andersevenrud/nordic.nvim'
  use 'rmehri01/onenord.nvim'
  use 'maxmx03/solarized.nvim'
  use 'folke/tokyonight.nvim'

  --
  -- Folder Explore
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    }
  }
  --
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-lua/popup.nvim' } }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons"
  }

  use { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }
  -- Debugger
  use {
    "mfussenegger/nvim-dap",
    requires = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-telescope/telescope-dap.nvim',
      'pedrohms/dap-install'
    }
  }

  -- Debugger for Python
  use { 'mfussenegger/nvim-dap-python' }

  -- Debugger for Golang
  use { 'leoluz/nvim-dap-go' }

  -- Mind for document
  use {
    'phaazon/mind.nvim',
    branch = 'v2.2',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'mind'.setup()
    end
  }
  -- Git
  use 'lewis6991/gitsigns.nvim' -- to check blame and changes

  -- snippets
  use 'L3MON4D3/LuaSnip'             --snippet engine
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

  -- LSP
  use "folke/neodev.nvim"               -- to show signature of methods
  use 'neovim/nvim-lspconfig'           -- enable LSP
  use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
  use 'ray-x/lsp_signature.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use "glepnir/lspsaga.nvim" -- LSP UI

  -- cmp plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'

  use {
  'windwp/nvim-autopairs',
  config = function() require("nvim-autopairs").setup {} end
  }

  use 'windwp/nvim-ts-autotag'

  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }

  -- Rust
  use 'simrat39/rust-tools.nvim'
  use 'preservim/tagbar'

  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })
end)
