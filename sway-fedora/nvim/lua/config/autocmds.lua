-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- LazyVim enables spell checking for Markdown by default. Disable it so
-- Markview buffers don't show spell-check underlines.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- User autocmds load on VeryLazy, after the startup buffer's FileType event.
if vim.bo.filetype == "markdown" then
  vim.opt_local.spell = false
end

-- vim.api.nvim_create_autocmd("Signal", {
--   pattern = "SIGUSR1",
--   callback = function()
--     vim.cmd("redraw!")
--     vim.notify("Theme refreshed")
--   end,
-- })

local signal = vim.uv.new_signal()
signal:start(vim.uv.constants.SIGUSR1, function()
  vim.schedule(function()
    vim.cmd.colorscheme("catppuccin-frappe")
    vim.cmd("redraw!")
    vim.notify("Theme refreshed")
  end)
end)
