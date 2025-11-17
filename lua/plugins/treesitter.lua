return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter")
    configs.setup({
      install_dir = NULL,
      ensure_installed = {
        "c", "lua", "vim", "vimdoc",
        "query", "javascript", "html",
        "python", "rust", "go" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
