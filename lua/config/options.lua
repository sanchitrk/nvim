-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Python host configuration (uses ~/bin/neovenv if it exists)
local neovenv = vim.fn.expand("~/bin/neovenv/bin/python3")
if vim.fn.executable(neovenv) == 1 then
  vim.g.python3_host_prog = neovenv
end

vim.g.lazyvim_picker = "telescope"

--
-- from ThePrimegean
--
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.hlsearch = false
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "100"
