return {
  "linux-cultist/venv-selector.nvim",
  opts = {
    search_venv_managers = false,
    search = true,
    name = { ".venv" }, -- uv will use .venv
    auto_refresh = true,
    auto_activate = true,
  },
  event = "VeryLazy",
}
