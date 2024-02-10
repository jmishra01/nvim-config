
local status_ok, utils = pcall(require, "core.utils")

if not status_ok then
  return
end


vim.diagnostic.config({virtual_text = false })


utils.nkeymap("<leader>d", ":lua vim.diagnostic.open_float()<CR>")
