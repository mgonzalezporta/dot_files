# Guard: load this setup only once per shell session.
if [ -n "${SETUP_EBI_PRO_SOURCED:-}" ]; then
    return 0
fi
export SETUP_EBI_PRO_SOURCED=1

# Hide macOS warning about the system Bash 3.2 being deprecated.
export BASH_SILENCE_DEPRECATION_WARNING=1

# Core shell aliases (file listing + tmux helpers).
alias df="df -h"
alias du="du -h"
alias grep="grep --color=auto"
alias ls="ls -G"
alias ll="ls -hl"
alias la="ls -hla"
alias lt="ls -hlart"
alias c="clear"
alias mux="tmux -2u attach || tmux new"
alias ms="tmux -2u source-file ~/.tmux.conf"
alias ml="tmux -2u list-sessions"
alias mk="tmux -2u list-sessions | awk 'BEGIN{FS=\":\"}{print $1}' | xargs -n 1 tmux kill-session -t"

# Utility functions.
mcd() { mkdir -p "$1"; cd "$1";}

# Enable bash completion (including git helpers) when installed via Homebrew.
if command -v brew >/dev/null 2>&1 && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    . "$(brew --prefix)/etc/bash_completion"
fi

# Prompt: show cwd, user@host, and git branch when __git_ps1 is available.
if type __git_ps1 >/dev/null 2>&1; then
    PS1='\n[`pwd`]\n\u@\h$(__git_ps1 " (%s)")$ '
else
    PS1='\n[`pwd`]\n\u@\h$ '
fi
# Alternative prompt without current git branch.
# PS1='\n[`pwd`]\n\u@\h$ '

# Bash history behavior and long-term command log.
export HISTFILESIZE=1000000
export HISTSIZE=100000
export HISTCONTROL=ignorespace
export HISTIGNORE='ls:history:ll'
export HISTTIMEFORMAT='%F %T '
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $(pwd) \
    "$(history 1)" >> ~/.bash_eternal_history'

# Homebrew environment (preferred). Fallback adds common Apple Silicon paths.
if command -v brew >/dev/null 2>&1; then
    eval "$(brew shellenv)"
else
    case ":$PATH:" in
        *":/opt/homebrew/bin:"*) ;;
        *) export PATH="/opt/homebrew/bin:$PATH" ;;
    esac
    case ":$PATH:" in
        *":/opt/homebrew/sbin:"*) ;;
        *) export PATH="/opt/homebrew/sbin:$PATH" ;;
    esac
fi
