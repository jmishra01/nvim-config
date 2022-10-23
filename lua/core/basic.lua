-- print("Basic NeoVim!!")

-- Encoding
vim.scriptencoding = 'utf-8'
vim.o.encoding = 'utf-8'
vim.o.fileencoding = "utf-8"                  -- the encoding written to a file

-- Split
vim.o.splitbelow = true                       -- force all horizontal splits to go below current window
vim.o.splitright = true                       -- force all vertical splits to go to the right of current window

vim.o.backup = false                          -- creates a backup file
vim.o.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.o.conceallevel = 0                        -- so that `` is visible in markdown files
vim.o.hlsearch = true                         -- highlight all matches on previous search pattern
vim.o.ignorecase = true                       -- ignore case in search patterns
vim.o.mouse = "a"                             -- allow the mouse to be used in neovim
vim.o.pumheight = 10                          -- pop up menu height
vim.o.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.o.showtabline = 1                         -- always show tabs
vim.o.smartcase = true                        -- smart case
vim.o.smartindent = true                      -- make indenting smarter again
vim.o.swapfile = false                        -- creates a swapfile
vim.o.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.o.timeoutlen = 100                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.undofile = true                         -- enable persistent undo
vim.o.updatetime = 300                        -- faster completion (4000ms default)
vim.o.writebackup = false                     -- if a file is being edited by another program (or was written to 
                                              -- file while editing with another program) it is not allowed to be edited
vim.o.expandtab = true                        -- convert tabs to spaces
vim.o.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.o.tabstop = 2                             -- insert 2 spaces for a tab
vim.o.cursorline = true                       -- highlight the current line
vim.o.cursorcolumn = false
vim.o.signcolumn = "yes"                      -- always show the sign column otherwise it would shift the text each time
vim.o.wrap = false                            -- display lines as one long line
vim.o.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.g.lazyredraw = true

-- Status line and command height
vim.o.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.o.laststatus = 2


-- Scroll
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- Number
vim.o.number = true                           -- set numbered lines
vim.o.relativenumber = true                   -- set relative numbered lines
vim.o.numberwidth = 4                         -- set number column width to 2 {default 4}

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
 
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]]



