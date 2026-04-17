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
          "rust_analyzer",
          "gopls",
          "taplo",
          "sqlls",
          "eslint"
        }
      })
    end
  }, {
    "hrsh7th/nvim-cmp",
    opts = function (_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0
      })
    end
  }, {
    "neovim/nvim-lspconfig",
    dependencies = {
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"hrsh7th/cmp-nvim-lua"},
      {"L3MON4D3/LuaSnip"},
      {"rafamadriz/friendly-snippets"}
    },
    config = function()
      require("plugins/lsp-config/config")
    end
  }
}
