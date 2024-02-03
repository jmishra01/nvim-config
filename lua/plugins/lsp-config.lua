return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "tsserver", "pyright",
          "rust_analyzer", "gopls", "taplo",
          "sqlls", "eslint"
        }
      })
    end
  }, {
  "neovim/nvim-lspconfig",
  dependencies = {
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },         -- Required
    { 'hrsh7th/cmp-buffer' },           -- Optional
    { 'hrsh7th/cmp-path' },             -- Optional
    { 'saadparwaiz1/cmp_luasnip' },     -- Optional
    { 'hrsh7th/cmp-nvim-lua' },         -- Optional
    -- Snippets
    { 'L3MON4D3/LuaSnip' },             -- Required
    { 'rafamadriz/friendly-snippets' }, -- Optional
  },
  config = function()
    require("config.lspconfig")
  end
}, {
    "folke/neodev.nvim", opts = {},
    config = function ()
      require("neodev").setup({
        library = {
          enabled = true,
          runtime = true,
          types = true,
          plugins = true
        },
        setup_jsonls = true,
        lspconfig = true,
        pathStrict = true
      })
    end
  -- "hrsh7th/cmp-nvim-lsp-signature-help",
}
}
