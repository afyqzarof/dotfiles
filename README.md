# dotfiles

My personal development environment configuration files for macOS.
This setup uses [GNU Stow](https://www.gnu.org/software/stow/) for
symlink management and provides configurations for terminal, editor,
and development tools.

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

```
dotfiles/
├── ghostty/          # Ghostty terminal configuration
├── nvim/             # Neovim configuration (LazyVim)
├── tmux/             # tmux configuration with plugins
├── zshrc/            # Zsh shell configuration
└── .stow-local-ignore # Stow ignore patterns
```

## 🚀 Installation

### Prerequisites

1. **Install Homebrew** (macOS package manager):

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install required tools**:

   ```bash
   brew install stow zsh tmux neovim ghostty lazygit zoxide
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

1. **Clone this repository**:

   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Stow configurations** (creates symlinks):

   ```bash
   stow ghostty nvim tmux zshrc
   ```

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

1. Create a new directory in the dotfiles root
2. Add your config files maintaining the target directory structure
3. Run `stow <directory-name>` to create symlinks

### Project-Specific Aliases

Update the directory aliases in `.zshrc` for your own projects:

```bash
alias myproject="cd ~/repos/myproject"
```

## 📋 Notes

- This setup is optimized for macOS development
- Requires Homebrew for package management
- Uses Stow for clean symlink management
- LazyVim provides a modern Neovim experience out of the box
- All configurations are version controlled for easy backup/restore

## 🔄 Updating

To update configurations:

1. Make changes to files in the dotfiles directory
2. Changes automatically reflect in the target locations (via symlinks)
3. Commit and push changes to maintain version control
