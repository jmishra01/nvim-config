local status_ok, utils = pcall(require, "core.utils")

if not status_ok then
  return
end

local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then return end

neo_tree.setup({
  source_selector = {
    winbar = false,
    statusline = false
  }})


utils.nkeymap("<leader>e", "<Cmd>NeoTreeFloatToggle<CR>")
