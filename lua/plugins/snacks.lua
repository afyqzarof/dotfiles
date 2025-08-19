local header = [[
▄   ▄ ▐▌▗▞▀▜▌  ▗▖      ▄  ▄▄▄     ▗▞▀▘ ▄▄▄     ▐▌▗▞▀▚▖
█ ▄ █ ▐▌▝▚▄▟▌▗▄▟▙▄▄▖   ▄ ▀▄▄      ▝▚▄▖█   █    ▐▌▐▛▀▀▘
█▄█▄█ ▐▛▀▚▖    ▐▌      █ ▄▄▄▀         ▀▄▄▄▀ ▗▞▀▜▌▝▚▄▄▖
      ▐▌ ▐▌    ▐▌      █                    ▝▚▄▟▌     
               ▝▚▄▄                                   
]]

return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = {
      enabled = false,
    },
    picker = {
      sources = {
        explorer = {
          layout = { layout = { position = "right" } },
        },
      },
    },
    dashboard = {
      preset = {
        header = header,
      },
    },
    terminal = {
      win = {
        position = "float",
      },
    },
  },
}
