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
  end
}

