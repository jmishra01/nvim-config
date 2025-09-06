
local rustaceanvim = {
  "mrcjkb/rustaceanvim",
  dependencies = {
    {"nvim-lua/plenary.nvim"},
    {"mfussenegger/nvim-dap"}
  },
  version = "^6",
  lazy = false
};

local crates = {
    "saecki/crates.nvim",
    tag = "stable",
    config = function ()
      require('crates').setup()
    end
  };

local rust_quick_tests = {
  'pgherveou/rust-quick-tests.nvim',
  ft = { 'rust' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = true,
  keys = {
    {
      'K',
      function()
        require('rust-quick-tests').hover_actions()
      end,
      desc = 'Rust tests Hover actions',
    },
    {
      '<leader>l',
      function()
        require('rust-quick-tests').replay_last()
      end,
      desc = 'Replay last test',
    },
  },
};


return { rustaceanvim, crates, rust_quick_tests }
