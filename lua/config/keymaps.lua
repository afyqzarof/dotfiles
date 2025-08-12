-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove LazyVim's default terminal keymap
vim.keymap.del("n", "<C-/>")

vim.keymap.set("n", "<C-j>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { noremap = true })

-- Remap <C-\> to open a floating terminal
-- Define a persistent terminal instance with ID 99
local Terminal = require("toggleterm.terminal").Terminal
local float_term = Terminal:new({
  direction = "float",
  id = 99,
  hidden = true, -- prevent from showing in terminal list
})

-- Map <C-/> to toggle the same floating terminal
vim.keymap.set("n", "<C-/>", function()
  float_term:toggle()
end, { desc = "Toggle floating terminal" })

vim.keymap.set("n", "<leader>vi", function()
  local file = vim.fn.expand("%:p")
  local ext = file:match("^.+(%..+)$")

  if ext == ".png" or ext == ".jpg" or ext == ".jpeg" or ext == ".gif" or ext == ".svg" then
    vim.cmd("silent !open -a 'Arc' " .. vim.fn.shellescape(file))
  else
    vim.notify("Not a supported image file (png, jpg, svg, etc)", vim.log.levels.WARN)
  end
end, { desc = "View Image in Arc" })

vim.keymap.set("n", "<leader>r", function()
  local ok, picker = pcall(function()
    return require("snacks").picker.get({ source = "explorer" })[1]
  end)

  if ok and picker and picker.input and picker.input.win then
    picker.input.win:focus()
  else
    require("snacks").explorer.open()
  end
end, { desc = "Focus or open Snacks Explorer" })
