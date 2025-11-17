
local catppuccin = { "catppuccin/nvim", name = "catppuccin", priority = 1000 };
local rose = { 'rose-pine/neovim', name = 'rose-pine' };
local gruvbox = {'darianmorat/gruvdark.nvim', lazy = false, priority = 1000};
local tokio_night = { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, };
local poimandres = {"olivercederborg/poimandres.nvim", lazy = false, priority = 1000}
local kanso = {"webhooked/kanso.nvim", lazy, priority=1000}


return {catppuccin, rose, gruvbox, tokio_night, poimandres, kanso}
