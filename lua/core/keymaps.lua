local status_ok, utils = pcall(require, "core.utils")

if not status_ok then
  return
end

--Remap space as leader key
utils.set_keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
utils.nkeymap("<C-h>", "<C-w>h")
utils.nkeymap("<C-j>", "<C-w>j")
utils.nkeymap("<C-k>", "<C-w>k")
utils.nkeymap("<C-l>", "<C-w>l")

-- Resize with arrows
utils.nkeymap("<C-Up>", ":resize -2<CR>")
utils.nkeymap("<C-Down>", ":resize +2<CR>")
utils.nkeymap("<C-Left>", ":vertical resize -2<CR>")
utils.nkeymap("<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
utils.nkeymap("<S-l>", ":bnext<CR>")
utils.nkeymap("<S-h>", ":bprevious<CR>")

-- Move text up and down
utils.nkeymap("<A-j>", "<Esc>:m .+1<CR>==gi")
utils.nkeymap("<A-k>", "<Esc>:m .-2<CR>==gi")

-- Insert --
-- Press jk fast to enter
utils.ikeymap("jk", "<ESC>")

-- Visual --
-- Stay in indent mode
utils.vkeymap("<", "<gv")
utils.vkeymap(">", ">gv")

-- Move text up and down
utils.vkeymap("<A-j>", ":m .+1<CR>==")
utils.vkeymap("<A-k>", ":m .-2<CR>==")
utils.vkeymap("p", '"_dP')

-- Visual Block --
-- Move text up and down
utils.xkeymap("J", ":move '>+1<CR>gv-gv")
utils.xkeymap("K", ":move '<-2<CR>gv-gv")
utils.xkeymap("<A-j>", ":move '>+1<CR>gv-gv")
utils.xkeymap("<A-k>", ":move '<-2<CR>gv-gv")

-- Terminal --
-- Better terminal navigation
utils.tkeymap("<C-h>", "<C-\\><C-N><C-w>h")
utils.tkeymap("<C-j>", "<C-\\><C-N><C-w>j")
utils.tkeymap("<C-k>", "<C-\\><C-N><C-w>k")
utils.tkeymap("<C-l>", "<C-\\><C-N><C-w>l")
