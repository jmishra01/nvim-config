return {
  {
  "mrcjkb/rustaceanvim",
  dependencies = {
    {"nvim-lua/plenary.nvim"},
    {"mfussenegger/nvim-dap"}
  },
  version = "^6",
  lazy = false
}, {
    "saecki/crates.nvim",
    tag = "stable",
    config = function ()
      require('crates').setup()
    end
  }
}

