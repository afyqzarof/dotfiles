return {
  "EdenEast/nightfox.nvim",
  config = function()
    local palettes = {
      carbonfox = {
        -- bg1 = "#151515",
      },
    }
    require("nightfox").setup({
      palettes = palettes,
      options = {
        styles = {
          comments = "italic",
          -- keywords = "bold",
          -- functions = "bold",
        },
        colorblind = {
          enable = true,
          severity = {
            protan = 0.4,
            deutan = 0.9,
            tritan = 0.2,
          },
        },
      },
    })

    vim.cmd("colorscheme carbonfox")
  end,
}
