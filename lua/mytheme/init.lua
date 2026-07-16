local M = {}

function M.setup()
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "mytheme"

  -- Base colors
  local colors = {
    bg = "#282c34",
    fg = "#abb2bf",
    func = "#61afef",
    keyword = "#c678dd",
    string = "#98c379",
    variable = "#e06c75",
    comment = "#656565"
  }

  -- Highlight groups
  vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
  vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keyword, bold = true })
  vim.api.nvim_set_hl(0, "String", { fg = colors.string })
  vim.api.nvim_set_hl(0, "Function", { fg = colors.func })
  vim.api.nvim_set_hl(0, "Variable", { fg = colors.variable })
end

return M
