-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- CUSTOM MACROS -
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

-- Python print (detects automatically)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.fn.setreg("l", "yoprint(f'" .. esc .. "pa: {" .. esc .. "pa}'" .. esc .. "l)")
  end,
})

-- JavaScript/TypeScript (explicit setting for these filetypes)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function()
    vim.fn.setreg("l", "yoconsole.log('" .. esc .. "pa:" .. esc .. "la," .. esc .. "pl")
  end,
})
