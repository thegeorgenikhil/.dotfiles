# Enable Powerlevel10k instant prompt. Must stay at the very top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# Environment Variables
# =============================================================================
typeset -U path PATH

path=(
  "$HOME/.local/bin"
  "/opt/homebrew/opt/python@3.14/bin"
  "/opt/homebrew/opt/openjdk@17/bin"
  "$HOME/.rbenv/bin"
  $path
)

export EDITOR=vim
export VISUAL=vim

export ANDROID_HOME=$HOME/Library/Android/sdk

# =============================================================================
# Package Managers
# =============================================================================

# NVM - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/thegeorgenikhil/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# rbenv
eval "$(rbenv init - zsh)"

# =============================================================================
# Powerlevel10k Theme
# =============================================================================
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# =============================================================================
# History
# =============================================================================
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY          # share history across terminal sessions
setopt HIST_IGNORE_DUPS       # don't save duplicate commands
setopt HIST_IGNORE_SPACE      # don't save commands prefixed with a space

# =============================================================================
# Completions
# =============================================================================
autoload -U compinit && compinit

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pnpm completion
eval "$(pnpm completion zsh)"

# =============================================================================
# Plugins
# =============================================================================

# Note: syntax-highlighting must come before autosuggestions
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Up/down arrows search history based on what's already typed
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# =============================================================================
# FZF - Fuzzy Finder
# =============================================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="
  --height 40%
  --layout=reverse
  --border
  --color=bg+:#1a1a1a,border:#00c2ff,pointer:#00c2ff,prompt:#ff8ffd
"

# =============================================================================
# Zoxide - smarter cd
# =============================================================================
eval "$(zoxide init zsh)"

# =============================================================================
# Aliases
# =============================================================================

# Git
alias cd='z'
alias gs='git status'

# Work aliases (loaded from separate file - not committed to git)
[[ -f $HOME/.work_aliases.zsh ]] && source $HOME/.work_aliases.zsh

# Use xterm-256color when SSHing to avoid unknown terminal type errors
alias ssh='TERM=xterm-256color ssh'

# =============================================================================
# Powerlevel10k Config — Must stay at the very bottom of ~/.zshrc.
# =============================================================================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
