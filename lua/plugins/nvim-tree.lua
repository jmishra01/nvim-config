local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
  return
end


local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  open_on_setup = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  filters = {
    exclude = {"__pycache__", "*.pyc"}
  },
  view = {
    mappings = {
      custom_only = false,
      list = {
        {key = { "l", "<CR>", "o" }, cb = tree_cb "edit"},
        {key = "h", cb = tree_cb "close_node"},
        {key = "v", cb = tree_cb "vsplit"},
      }
    },
  }
}

local status_ok, utils = pcall(require, "core.utils")

if not status_ok then
  return
end

utils.nkeymap("<leader>e", "<Cmd>NvimTreeToggle<CR>")
