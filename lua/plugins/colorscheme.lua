-- Setup
--
-- local status_ok, vscode = pcall(require, "vscode")
-- if not status_ok then return end
-- local c = require("vscode.colors").get_colors()
-- 
-- vscode.setup({
--   transparent = true,
--   italic_comment = true,
--   disable_nvimtree_bg = true,
--   color_overrides = { vscLineNumber = '#FFFFFF'},
--   group_overrides = {Cursor = {fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true}}
-- })


-- vim.cmd [[colorscheme github_dark]]
vim.cmd [[colorscheme nordic]]


vim.cmd [[colorscheme solarized]]


require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = {
    enable = false,
    disable = {"css"}
  },
  autopairs = { enable = true },
  indent = { enable = true, disable = { "python", "css" }},
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
})

