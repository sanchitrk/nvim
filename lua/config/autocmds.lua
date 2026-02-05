-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
--
-- Auto-save when leaving a buffer (only for normal, saveable files)
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertLeave" }, {
  pattern = "*",
  callback = function()
    -- Skip if buffer is not modified or not a normal file
    if not vim.bo.modified then
      return
    end
    -- Skip special buffers (no name, not a file, readonly, etc.)
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname == "" or vim.bo.buftype ~= "" or vim.bo.readonly then
      return
    end
    -- Attempt save and notify on failure
    local ok, err = pcall(vim.cmd, "write")
    if not ok then
      vim.notify("Auto-save failed: " .. err, vim.log.levels.WARN)
    end
  end,
})
