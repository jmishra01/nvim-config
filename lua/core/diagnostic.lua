
-- virtual_text = {
--     prefix = "●", -- could be '■', '▎', 'x'
--     spacing = 1,  -- extra spacing before text
--     source = "always", -- show source name if multiple
--     format = function(diagnostic) return diagnostic.message end
--   }

vim.diagnostic.config({
  virtual_lines = true,
  signs = true,          -- show signs in the sign column
  underline = true,      -- underline the text
  update_in_insert = false, -- delay updates while typing
  severity_sort = true,  -- sort diagnostics by severity
})

