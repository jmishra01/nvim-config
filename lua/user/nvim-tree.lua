vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌"
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  }
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
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

local utils_status, M = pcall(require, "user.utils")
if not utils_status then
  return
end

M.nkeymap("<leader>e", "<cmd>NvimTreeToggle<CR>")
