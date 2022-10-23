local M = {}

M.opts = { noremap = true, silent = true }
M.term_opts = { silent = true }

-- Shorten function name
M.keymap = vim.api.nvim_set_keymap

function M.nkeymap(s, c)
  M.keymap("n", s, c, M.opts)
end


function M.ikeymap(s, c)
  M.keymap("i", s, c, M.opts)
end

function M.vkeymap(s, c)
  M.keymap("v", s, c, M.opts)
end

function M.xkeymap(s, c)
  M.keymap("x", s, c, M.opts)
end

function M.tkeymap(s, c)
  M.keymap("t", s, c, M.term_opts)
end

return M
