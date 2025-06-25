return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({
          cwd = require("lazy.core.config").options.root,
        })
      end,
      desc = "Find Plugin File",
    },
  },
  opts = function(_, opts)
    -- You can tweak layout and other settings here
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      file_ignore_patterns = {
        "node_modules",
        "dist",
      },
    })

    return opts
  end,
}
