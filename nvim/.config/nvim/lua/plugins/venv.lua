return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  opts = {
    name = { ".venv" }, -- uv creates .venv
    auto_refresh = true,
    auto_activate = true, -- Automatically activate when entering project
    search_venv_managers = true, -- Also find conda, pyenv, etc.
  },
  keys = {
    { "<leader>pv", "<cmd>VenvSelect<cr>", desc = "Select Python Venv" },
  },
  event = "BufEnter *.py",
}
