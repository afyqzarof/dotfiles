local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                maxPreload = 10000,
                preloadFileSize = 1000,
              },
            },
          },
        },
      },
      setup = {
        vtsls = function(_, opts)
          -- Add your root_dir override here
          opts.root_dir = util.root_pattern("package.json", "tsconfig.json", ".git")

          -- Add other custom opts or capabilities here if you want
          -- e.g., opts.capabilities.offsetEncoding = { "utf-16" }

          lspconfig.vtsls.setup(opts)
          return true
        end,
        -- Setup functions for other servers...
      },
    },
  },
}
