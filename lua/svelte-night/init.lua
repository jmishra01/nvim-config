local M = {}

local palette = {
  bg      = "#101218",
  fg      = "#d8dee9",
  muted   = "#687080",
  red     = "#ff6b7a",
  orange  = "#f5a97f",
  yellow  = "#eed49f",
  green   = "#a6da95",
  cyan    = "#8bd5ca",
  blue    = "#8aadf4",
  purple  = "#c6a0f6",
}

local function highlight(group, options)
  vim.api.nvim_set_hl(0, group, options)
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end

  vim.g.colors_name = "svelte-night"

  -- Editor UI
  highlight("Normal",       { fg = palette.fg, bg = palette.bg })
  highlight("NormalFloat",  { fg = palette.fg, bg = "#171a22" })
  highlight("CursorLine",   { bg = "#171a22" })
  highlight("LineNr",       { fg = palette.muted })
  highlight("CursorLineNr", { fg = palette.yellow, bold = true })
  highlight("Visual",       { bg = "#30364a" })

  -- Traditional syntax groups
  highlight("Comment",    { fg = palette.muted, italic = true })
  highlight("String",     { fg = palette.green })
  highlight("Number",     { fg = palette.orange })
  highlight("Boolean",    { fg = palette.orange })
  highlight("Function",   { fg = palette.blue })
  highlight("Keyword",    { fg = palette.purple, bold = true })
  highlight("Type",       { fg = palette.yellow })
  highlight("Operator",   { fg = palette.cyan })
  highlight("Identifier", { fg = palette.fg })

  -- Tree-sitter: HTML and Svelte markup
  highlight("@tag",           { fg = palette.red })
  highlight("@tag.builtin",   { fg = palette.red, bold = true })
  highlight("@tag.attribute", { fg = palette.yellow })
  highlight("@tag.delimiter", { fg = palette.muted })

  -- Svelte blocks: {#if}, {:else}, {#each}, {/if}
  highlight("@keyword",             { fg = palette.purple })
  highlight("@keyword.conditional", { fg = palette.purple, bold = true })
  highlight("@keyword.repeat",      { fg = palette.purple, bold = true })
  highlight("@keyword.coroutine",   { fg = palette.purple })
  highlight("@keyword.exception",   { fg = palette.red })
  highlight("@keyword.modifier",    { fg = palette.purple })

  -- JavaScript and TypeScript inside Svelte
  highlight("@variable",           { fg = palette.fg })
  highlight("@variable.builtin",   { fg = palette.red })
  highlight("@function",           { fg = palette.blue })
  highlight("@function.call",      { fg = palette.blue })
  highlight("@function.builtin",   { fg = palette.cyan })
  highlight("@property",           { fg = palette.cyan })
  highlight("@constructor",        { fg = palette.yellow })
  highlight("@type",               { fg = palette.yellow })
  highlight("@operator",           { fg = palette.cyan })
  highlight("@punctuation.bracket", { fg = palette.fg })

  -- CSS inside <style>
  highlight("@attribute",          { fg = palette.yellow })
  highlight("@string",             { fg = palette.green })
  highlight("@number",             { fg = palette.orange })
  highlight("@constant",           { fg = palette.orange })
  highlight("@comment",            { link = "Comment" })

  -- Diagnostics
  highlight("DiagnosticError", { fg = palette.red })
  highlight("DiagnosticWarn",  { fg = palette.yellow })
  highlight("DiagnosticInfo",  { fg = palette.blue })
  highlight("DiagnosticHint",  { fg = palette.cyan })
end

return M
