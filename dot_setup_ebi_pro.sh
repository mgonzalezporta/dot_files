# Guard: load this setup only once per shell session.
if [ -n "${SETUP_EBI_PRO_SOURCED:-}" ]; then
    return 0
fi
export SETUP_EBI_PRO_SOURCED=1

# Hide macOS warning about the system Bash 3.2 being deprecated.
export BASH_SILENCE_DEPRECATION_WARNING=1

# Prepend a path segment only if it is not already present.
add_path_front() {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$1:$PATH" ;;
    esac
}

# Core shell aliases (file listing helpers).
alias df="df -h"
alias du="du -h"
alias grep="grep --color=auto"
alias ls="ls -G"
alias ll="ls -hl"
alias la="ls -hla"
alias lt="ls -hlart"
alias c="clear"

# tmux helpers (enabled only when tmux is available).
if command -v tmux >/dev/null 2>&1; then
    alias mux="tmux -2u attach || tmux new"
    alias ms="tmux -2u source-file ~/.tmux.conf"
    alias ml="tmux -2u list-sessions"
    mk() {
        printf "Kill ALL tmux sessions? [y/N] "
        read -r reply
        case "$reply" in
            y|Y|yes|YES)
                tmux -2u list-sessions | awk 'BEGIN{FS=":"}{print $1}' | xargs -n 1 tmux kill-session -t
                ;;
            *) echo "Canceled." ;;
        esac
    }
fi

# Utility functions.
mcd() {
    [ -n "$1" ] || return 1
    mkdir -p "$1" && cd "$1"
}

# Enable bash completion (including git helpers) when installed via Homebrew.
if command -v brew >/dev/null 2>&1 && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    . "$(brew --prefix)/etc/bash_completion"
fi

# Prompt: show cwd, user@host, and git branch when __git_ps1 is available.
if type __git_ps1 >/dev/null 2>&1; then
    PS1='\n[\w]\n\u@\h$(__git_ps1 " (%s)")$ '
else
    PS1='\n[\w]\n\u@\h$ '
fi
# Alternative prompt without current git branch.
# PS1='\n[\w]\n\u@\h$ '

# Bash history behavior and long-term command log.
export HISTFILESIZE=1000000
export HISTSIZE=100000
export HISTCONTROL=ignorespace
export HISTIGNORE='ls:history:ll'
export HISTTIMEFORMAT='%F %T '
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ "$(pwd)" \
    "$(history 1)" >> ~/.bash_eternal_history'

# Homebrew environment for interactive shells; otherwise set only PATH segments.
if command -v brew >/dev/null 2>&1; then
    if [[ $- == *i* ]]; then
        eval "$(brew shellenv)"
    else
        add_path_front "/opt/homebrew/sbin"
        add_path_front "/opt/homebrew/bin"
    fi
else
    add_path_front "/opt/homebrew/sbin"
    add_path_front "/opt/homebrew/bin"
fi

export PATH
