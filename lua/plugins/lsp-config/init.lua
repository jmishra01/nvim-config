return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  }, {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "gopls",
          "taplo",
          "sqlls",
          "eslint",
          "html"
        },
        automatic_enable = false
      })
    end
  }, {
    "neovim/nvim-lspconfig",
    dependencies = {
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-nvim-lsp-signature-help"},
      {"saadparwaiz1/cmp_luasnip"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"hrsh7th/cmp-nvim-lua"},
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      },
      {"rafamadriz/friendly-snippets"}
    },
    config = function()
      require("plugins/lsp-config/config")
    end
  }
}
