return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()

    require("nvim-treesitter").setup({
    ensure_installed = {
      "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css",
      "python", "rust", "go", "svelte"
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {enable = true},
    ignore_install = {},
  })

    -- local configs = require("nvim-treesitter")

    -- configs.setup({
    --   install_dir = NULL,
    --   ensure_installed = { "c", "lua", "vim", "vimdoc",
    --     "query", "javascript", "html", "css",
    --     "python", "rust", "go", "svelte" },
    --   sync_install = false,
    --   highlight = { enable = true },
    --   indent = { enable = true },
    -- })


  end
}
