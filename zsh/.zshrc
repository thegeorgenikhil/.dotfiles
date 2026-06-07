# Enable Powerlevel10k instant prompt. Must stay at the very top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HOMEBREW_PREFIX="/opt/homebrew"

# Helper function to cache the output of expensive eval commands.
# It stores the result in ~/.cache/zsh/<name>.zsh and only regenerates
# the cache if the file does not exist or is older than 7 days (604800 seconds).
# Usage: _cached_eval <cache_name> <command to eval>
_cached_eval() {
  local name=$1; shift
  local cache="$HOME/.cache/zsh/${name}.zsh"
  mkdir -p "$HOME/.cache/zsh"
  if [[ ! -f "$cache" ]] || (( $(date +%s) - $(stat -f%m "$cache") > 604800 )); then
    eval "$@" > "$cache"
  fi
  source "$cache"
}

# =============================================================================
# Environment Variables
# =============================================================================
typeset -U path PATH

path=(
  "$HOME/.local/bin"
  "/opt/homebrew/opt/python@3.14/bin"
  "/opt/homebrew/opt/openjdk@17/bin"
  "$HOME/.rbenv/bin"
  "/opt/homebrew/opt/postgresql@18/bin"
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

# Lazy-load NVM
# export NVM_DIR="$HOME/.nvm"
# lazy_load_nvm() {
#   unset -f nvm node npm npx
#   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# }
# for cmd in nvm node npm npx; do
#   eval "${cmd}() { lazy_load_nvm; ${cmd} \$@; }"
# done

# pnpm
export PNPM_HOME="/Users/thegeorgenikhil/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# rbenv
_cached_eval "rbenv" "rbenv init - zsh"

# =============================================================================
# Powerlevel10k Theme
# =============================================================================
source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme

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

# Bridge completions from other shells when carapace lacks native support
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Highlight and cycle through completions with arrow keys
zstyle ':completion:*' menu select

# Group commands by category for git
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'

source <(carapace _carapace)

# pnpm completion
_cached_eval "pnpm-completion" "pnpm completion zsh"

# =============================================================================
# Plugins
# =============================================================================

# Note: syntax-highlighting must come before autosuggestions
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Up/down arrows search history based on what's already typed
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Edit long commands in vim with Ctrl-X Ctrl-E
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

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
# Aliases
# =============================================================================

# Claude Code
alias cc='claude'

# Git
alias gs='git status'

# Hunk - TUI Git Diff Viewer
alias h='hunk'

# Zoxide
alias j='z'
alias jj='zi'
 
# Work aliases (separate file, committed encrypted via git-crypt; run `git-crypt unlock` after cloning)
[[ -f $HOME/.work_aliases.zsh ]] && source $HOME/.work_aliases.zsh

# ── Remote-session theme ─────────────────────────────────────────────────────
# While connected to a remote machine, flip the Ghostty pane into a Deep Purple
# theme so it's unmistakable we're not on the local box, then reset to the
# configured dark theme on exit. Only recolors in Ghostty; resets via OSC
# 110/111/104 so it always tracks whatever config.ghostty defines.
# Used by the ssh wrapper below and the ssm-connect wrapper in .work_aliases.zsh.
_ghostty_remote_on() {
  [[ "$TERM_PROGRAM" == "ghostty" ]] || return 0
  printf '\033]10;#e6dcff\007'   # foreground (pale lavender)
  printf '\033]11;#1e0a2e\007'   # background (deep purple)
  # 16 ANSI colors (Deep Purple)
  printf '\033]4;0;#3b2a4d;1;#ff6188;2;#a9dc76;3;#ffd866;4;#78a9ff;5;#c792ea;6;#78dce8;7;#e6dcff;8;#6b5b8a;9;#ff8aa8;10;#bde896;11;#ffe48a;12;#9cc0ff;13;#dab6f5;14;#9ae6ef;15;#ffffff\007'
}
_ghostty_remote_off() {
  [[ "$TERM_PROGRAM" == "ghostty" ]] || return 0
  printf '\033]110\007'   # reset foreground to config default
  printf '\033]111\007'   # reset background to config default
  printf '\033]104\007'   # reset all 16 palette colors to config defaults
}

# ssh: force xterm-256color (avoids unknown-terminal errors) + remote theme.
# The `always` block guarantees the theme resets even when the session is ended
# with Ctrl-C, which otherwise aborts the function before the reset would run.
ssh() {
  _ghostty_remote_on
  {
    TERM=xterm-256color command ssh "$@"
  } always {
    _ghostty_remote_off
  }
}

# =============================================================================
# Zoxide - smarter cd
# =============================================================================
eval "$(zoxide init zsh)"

# =============================================================================
# Powerlevel10k Config — Must stay at the very bottom of ~/.zshrc.
# =============================================================================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
