local M = {}

M.opts = { noremap = true, silent = true }
M.term_opts = { silent = true }

-- Shorten function name
M.keymap = vim.api.nvim_set_keymap

function M.nkeymap(s, c)
  M.keymap("n", s, c, M.opts)
end

return M
