-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.python_host_prog = "/Users/sanchitrk/bin/neovenv/bin/python"
vim.g.python3_host_prog = "/Users/sanchitrk/bin/neovenv/bin/python"

vim.g.lazyvim_picker = "telescope"

--
-- from ThePrimegean
--
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.hlsearch = false
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "100"
