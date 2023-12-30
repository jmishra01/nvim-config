local M = {}

M.opts = { noremap = true, silent = true }
M.term_opts = { silent = true }

-- Shorten function name
M.keymap = vim.api.nvim_set_keymap

function M.set_keymap(m, s, c)
  M.keymap(m, s, c, M.opts)
end

function M.nkeymap(s, c)
  M.set_keymap("n", s, c)
end

function M.ikeymap(s, c)
  M.set_keymap("i", s, c)
end

function M.vkeymap(s, c)
  M.set_keymap("v", s, c)
end

function M.xkeymap(s, c)
  M.set_keymap("x", s, c)
end

function M.tkeymap(s, c)
  M.keymap("t", s, c, M.term_opts)
end
return M

