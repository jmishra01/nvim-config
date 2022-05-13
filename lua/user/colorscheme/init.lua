-- Construct file
vim.cmd [[
try
  colorscheme terafox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme darkplus
  set background=light
endtry
]]
