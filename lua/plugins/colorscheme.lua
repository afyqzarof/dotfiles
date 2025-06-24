return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("nightfox").setup({
          options = {
            colorblind = {
              enable = true,
              severity = {
                protan = 0.3,
                deutan = 0.6,
              },
            },
          },
        })
      end,
    },
  },
}
