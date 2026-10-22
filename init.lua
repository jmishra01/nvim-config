require "core"
require "pack"
require("lazy").setup("plugins")



-- vim.api.nvim_create_autocmd("CursorHold", {
--   callback = function ()
--     vim.lsp.buf.document_highlight()
--   end
-- })
-- 
-- 
-- vim.api.nvim_create_autocmd("CursorHoldI", {
--   callback = function ()
--     vim.lsp.buf.document_highlight()
--   end
-- })
-- 
-- 
-- vim.api.nvim_create_autocmd("CursorMoved", {
--   callback = function ()
--     vim.lsp.buf.clear_references()
--   end
-- })
--


require("svelte-night").load()

local rust_mir =  require("rust_mir");

vim.api.nvim_create_user_command("RustMir", function ()
  rust_mir.show_mir()
end, {})

vim.keymap.set("n", "<leader>rm", function ()
  rust_mir.show_mir()
end, {desc = "Show Rust MIR"})
