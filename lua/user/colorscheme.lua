vim.cmd [[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme darkplus
  set background=light
endtry
]]
