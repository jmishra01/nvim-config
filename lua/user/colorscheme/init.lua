-- Construct file
vim.cmd [[
try
  colorscheme github_dark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme darkplus
  set background=light
endtry
]]
