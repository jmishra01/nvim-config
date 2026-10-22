
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


-- Diagnostics tagged "unnecessary" (e.g. rust-analyzer's inactive `#[cfg]` code,
-- unused variables) only get the dimmed DiagnosticUnnecessary highlight, without
-- the severity underline that nvim 0.12 stacks on top of it.
local underline = vim.diagnostic.handlers.underline
local unnecessary_ns = {}

vim.diagnostic.handlers.underline = {
  show = function(namespace, bufnr, diagnostics, opts)
    local ns = unnecessary_ns[namespace]
    if not ns then
      ns = vim.api.nvim_create_namespace("")
      unnecessary_ns[namespace] = ns
    end
    vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

    local rest = {}
    for _, d in ipairs(diagnostics) do
      if d._tags and d._tags.unnecessary then
        vim.hl.range(bufnr, ns, "DiagnosticUnnecessary", { d.lnum, d.col }, { d.end_lnum, d.end_col }, {
          priority = vim.hl.priorities.diagnostics,
        })
      else
        table.insert(rest, d)
      end
    end
    underline.show(namespace, bufnr, rest, opts)
  end,
  hide = function(namespace, bufnr)
    local ns = unnecessary_ns[namespace]
    if ns and vim.api.nvim_buf_is_valid(bufnr) then
      vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
    end
    underline.hide(namespace, bufnr)
  end,
}
