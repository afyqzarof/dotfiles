-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>vi", function()
  local file = vim.fn.expand("%:p")
  local ext = file:match("^.+(%..+)$")

  if ext == ".png" or ext == ".jpg" or ext == ".jpeg" or ext == ".gif" or ext == ".svg" then
    vim.cmd("silent !open -a 'Arc' " .. vim.fn.shellescape(file))
  else
    vim.notify("Not a supported image file (png, jpg, svg, etc)", vim.log.levels.WARN)
  end
end, { desc = "View Image in Arc" })
