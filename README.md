# afyq's neovim config using LazyVim

Refer to the [documentation](https://lazyvim.github.io/installation)

## Installation

1. Make a backup of your current Neovim files:

   ```bash
   # required
   mv ~/.config/nvim{,.bak}

   # optional but recommended
   mv ~/.local/share/nvim{,.bak}
   mv ~/.local/state/nvim{,.bak}
   mv ~/.cache/nvim{,.bak}``
   ```

2. Clone the starter

   ```bash
   git clone git@github.com:afyqzarof/nvim-config.git ~/.config/nvim
   ```

## Notes

- For python LSP to use the correct venv use commands:

  ```vim
  :lua print(vim.env.VIRTUAL_ENV)
  ```

  if that prints nil or an empty string, then the virtual environment isn't
  being picked up, and your LSP has no access to installed packages.

  ```vim
  :VenvSelect
  ```

  Pick your .venv from the list.
