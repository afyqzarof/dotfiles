# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Environment
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR='nvim'
export KEYTIMEOUT=1

# Homebrew (Apple Silicon)
if [ -d /opt/homebrew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Zoxide
eval "$(zoxide init zsh)"

# Aliases
alias gap="git add -p"
alias gs="git status"
alias v="nvim"
alias vim="nvim"
alias cl="clear"
alias lg="lazygit"
alias lzs="lazysql"
alias cd="z"
alias csv="csvlens"
alias wttr="curl wttr.in"
alias lzd="lazydocker"
alias python3="/opt/homebrew/bin/python3.12"
alias python="/opt/homebrew/bin/python3.12"

# Work directories
alias enjin="cd ~/repos/enjin"
alias pl="cd ~/repos/enjin/enjin-pelanggan"
alias kn="cd ~/repos/enjin/enjin-konsol"
alias wf="cd ~/repos/enjin/enjin-workflow"
alias core="cd ~/repos/enjin/enjin-core"
alias prok="cd ~/repos/enjin/enjin-proksi"

# Development commands
alias ps="echo '=== Current Environment ===' && cat .env.local && echo '========================' && echo '' && pnpm start"
alias fmt="pnpm fmt"
alias cicheck="pnpm ci-check"
alias ad="pnpm advertisement-gen"

# Vi mode
bindkey -v
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# Vi mode cursor indicator
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} == '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
echo -ne '\e[5 q'

# Functions
gql() {
  if pnpm run | grep -q "gql-generate"; then
    pnpm gql-generate "$@"
  elif pnpm run | grep -q "gql-gen"; then
    pnpm gql-gen "$@"
  else
    echo "❌ no gql script found in this repo"
  fi
}
