vim.keymap.set("n", "<C-j>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { noremap = true })
-- remap g to Q
vim.keymap.set("n", "Q", "q")
vim.keymap.set("n", "q", "<nop>")

vim.keymap.set("n", ";", ":")
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
