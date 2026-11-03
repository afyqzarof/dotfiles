# dotfiles

My personal development environment configuration files for macOS.
Files live at their real paths in `$HOME` and are tracked with a
[bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)
in `~/.cfg`, so there are no symlinks and no extra tools.

## 🔧 Technologies & Tools

### Shell & Terminal

- **Zsh** with [Oh My Zsh](https://ohmyz.sh/) framework
- **Ghostty** terminal emulator with dark pastel theme
- **tmux** with plugin manager and minimal status bar
- **Zoxide** for smart directory navigation

### Editor

- **Neovim** with [LazyVim](https://www.lazyvim.org/) distribution
- **Language Support**: TypeScript, Python, Go, Docker, JSON,
  Markdown, Tailwind CSS, TOML
- **AI Assistance**: Supermaven integration
- **Colorscheme**: Carbonfox (Nightfox variant)

### Development Tools

- **Node.js**: NVM for version management, pnpm as package manager
- **Git**: Custom aliases and integrations
- **Lazygit**: Terminal-based Git UI
- **Testing**: Neotest for Go and Python

## 📁 Structure

Paths in the repo mirror `$HOME`:

```
~
├── .zshrc               # Zsh shell configuration
├── .gitignore           # Ignores for the dotfiles repo
├── .github/README.md    # This file
└── .config/
    ├── ghostty/         # Ghostty terminal configuration
    ├── nvim/            # Neovim configuration (LazyVim)
    └── tmux/            # tmux configuration
```

## 🚀 Installation

### Prerequisites

1. **Install Homebrew** (macOS package manager):

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install required tools**:

   ```bash
   brew install zsh tmux neovim ghostty lazygit zoxide
   ```

3. **Install Oh My Zsh**:

   ```bash
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

4. **Install tmux Plugin Manager**:

   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

### Setup Dotfiles

1. **Clone as a bare repository and check it out into `$HOME`**:

   ```bash
   git clone --bare git@github.com:afyqzarof/dotfiles.git "$HOME/.cfg"
   alias config='git --git-dir=$HOME/.cfg --work-tree=$HOME'
   config checkout
   config config --local status.showUntrackedFiles no
   ```

   If `checkout` fails because files already exist (e.g. a default
   `.zshrc`), move them aside and retry:

   ```bash
   mkdir -p ~/.config-backup
   config checkout 2>&1 | grep -E '^\s+' | awk '{print $1}' |
     xargs -I{} sh -c 'mkdir -p ~/.config-backup/$(dirname {}) && mv ~/{} ~/.config-backup/{}'
   config checkout
   ```

   **Migrating a machine that used the old stow layout**: remove the
   stow symlinks first (`rm ~/.zshrc ~/.config/{nvim,tmux,ghostty}`),
   then run the steps above. Copy over `lazy-lock.json` from the old
   `~/dotfiles/nvim/.config/nvim/` if you want to keep plugin versions.

2. **Open a new shell** so the `config` alias from `.zshrc` is loaded.

3. **Install tmux plugins** (after starting tmux):

   ```
   # In tmux, press: Ctrl+b + I
   ```

4. **Install Neovim plugins**:

   ```bash
   nvim # LazyVim will auto-install plugins on first run
   ```

## ⚙️ Key Features

### Zsh Configuration

- **Aliases**:
  - `v`/`vim` → `nvim`
  - `gap` → `git add -p`
  - `gs` → `git status`
  - `lg` → `lazygit`
  - `cd` → `z` (zoxide)
- **Project shortcuts** for quick navigation
- **Development commands** for pnpm workflows

### Neovim Setup

- **LazyVim Extras**:
  - Language servers for TypeScript, Python, Go, Docker
  - Formatters: Biome, Prettier
  - Linting: ESLint
  - AI coding assistance with Supermaven
  - Testing framework integration
  - Mini.files for file exploration

### tmux Configuration

- **Mouse support enabled**
- **Custom keybindings**: `Ctrl+b + r` to reload config
- **Status bar toggle**: `Ctrl+b + b`
- **Minimal status theme**

## 🛠️ Customization

### Adding New Configurations

Use `config` exactly like `git`, from anywhere:

```bash
config add ~/.config/lazygit/config.yml
config commit -m "feat(lazygit): add config"
config push
```

Untracked files in `$HOME` are hidden from `config status`, so only
files you explicitly `config add` are tracked.

### Project-Specific Aliases

Update the directory aliases in `.zshrc` for your own projects:

```bash
alias myproject="cd ~/repos/myproject"
```

## 📋 Notes

- This setup is optimized for macOS development
- Requires Homebrew for package management
- Uses a bare git repo in `~/.cfg` instead of symlinks
- LazyVim provides a modern Neovim experience out of the box
- All configurations are version controlled for easy backup/restore

## 🔄 Updating

To update configurations:

1. Edit files in place (e.g. `~/.config/nvim/...`)
2. Review with `config status` / `config diff`
3. Commit and push with `config commit` / `config push`

## git snippets

```
[fetch]
 prune = true
[alias]
    default = "!git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'"
    bclean = "!git gone | xargs -r git branch -D"
    # Switches to specified branch (or the default branch if no branch is specified), runs git up, then runs bclean.
    bdone = "!f() { DEFAULT=$(git default); git checkout ${1-$DEFAULT} && git up && git bclean; }; f"
    gone = "!git for-each-ref --format='%(refname:short) %(upstream:track)' refs/heads/ | awk '$2 == \"[gone]\" { print $1 }'"

```
