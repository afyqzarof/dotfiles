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
alias gl='git pull && git bclean'

# Work directories
alias arrow="cd ~/repos/arrow"
alias arq="cd ~/repos/arrow/apps/arq"
alias be="cd ~/repos/arrow/apps/backend"
alias fe="cd ~/repos/arrow/apps/frontend"
alias rae="cd ~/repos/arrow/apps/rae"
alias vec="cd ~/repos/arrow/apps/vector"
alias biz="cd ~/repos/arrow/apps/business"

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

# Created by `pipx` on 2026-02-04 02:42:58
export PATH="$PATH:/Users/afyq/.local/bin"

# Zoxide
eval "$(zoxide init zsh)"
