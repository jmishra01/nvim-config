require "core.disable"
require "core.options"
require "core.keymaps"


-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})
require("core.lsp_lines").setup()
