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

vim.keymap.set("n", "<leader>vv", function()
  local file = vim.fn.expand("%:p")
  local ext = file:match("^.+(%..+)$")

  if not ext then
    vim.notify("No file extension found", vim.log.levels.WARN)
    return
  end

  ext = ext:lower()
  local supported = { [".png"] = true, [".jpg"] = true, [".jpeg"] = true, [".gif"] = true, [".svg"] = true }
  if not supported[ext] then
    vim.notify("Unsupported image type", vim.log.levels.WARN)
    return
  end

  local cmd
  if ext == ".svg" then
    cmd = "rsvg-convert -w 500 -h 500 " .. vim.fn.shellescape(file) .. " | viu -"
  else
    cmd = "viu " .. vim.fn.shellescape(file)
  end

  -- Floating window dimensions
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.6)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create floating terminal window
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
  })

  -- Start the job using jobstart (recommended over termopen)
  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    pty = true,
    on_exit = function()
      -- Optional: auto-close after a short delay
      vim.defer_fn(function()
        if vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_win_close(win, true)
        end
      end, 4000)
    end,
  })

  -- Optional: enter insert mode to allow terminal input
  vim.cmd("startinsert")
end, { desc = "🖼️ Preview image in floating terminal (no deprecations)" })
