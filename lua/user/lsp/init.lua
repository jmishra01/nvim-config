local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
local m = require("user.lsp.handlers")

m.setup()

require "user.lsp.null-ls"
