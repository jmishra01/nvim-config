local mason = {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  };

local mason_lspconfig = {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "pyright", "rust_analyzer", "gopls", "taplo",
          "sqlls", "eslint"
        }
      })
    end
  };

local nvim_lspconfig = {
  "neovim/nvim-lspconfig",
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },         -- Required
    { 'hrsh7th/cmp-buffer' },           -- Optional
    { 'hrsh7th/cmp-path' },             -- Optional
 --   { 'saadparwaiz1/cmp_luasnip' },     -- Optional
    { 'hrsh7th/cmp-nvim-lua' },         -- Optional
    -- Snippets
    { 'L3MON4D3/LuaSnip' },             -- Required
    { 'rafamadriz/friendly-snippets' }, -- Optional
  },
  config = function()
    require("config.lspconfig")
  end
};

local neodev = {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
    library = {
      {path = "${3rd}/luv/library", words = {"vim%.uv"}}
    }
  }
};

local nvim_cmp = {
  'hrsh7th/nvim-cmp',
  opts = function (_, opts)
    opts.sources = opts.sources or {}
    table.insert(opts.sources, {
      name = "lazydev",
      group_index = 0
    })
  end
};


-- saghen/blink.cmp

return { mason, mason_lspconfig, neodev, nvim_cmp, nvim_lspconfig }
