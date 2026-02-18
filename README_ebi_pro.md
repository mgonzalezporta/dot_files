# EBI Pro Bash Setup

This setup provides a modular Bash profile for your EBI MacBook Pro.

## Files

- `/Users/mar/Documents/git-workspace/dot_files/dot_bashrc_ebi_pro`
- `/Users/mar/Documents/git-workspace/dot_files/dot_setup_ebi_pro.sh`

Load flow:

1. `~/.bashrc` (from `dot_bashrc_ebi_pro`) is loaded by Bash.
2. It sources `~/.setup_ebi_pro.sh`.
3. `~/.setup_ebi_pro.sh` configures aliases, prompt, history, and Homebrew environment.

## Install

```bash
cp /Users/mar/Documents/git-workspace/dot_files/dot_bashrc_ebi_pro ~/.bashrc
cp /Users/mar/Documents/git-workspace/dot_files/dot_setup_ebi_pro.sh ~/.setup_ebi_pro.sh
```

Reload shell config:

```bash
source ~/.bashrc
```

## What This Setup Configures

- Single-load guard (`SETUP_EBI_PRO_SOURCED`) to avoid duplicate sourcing.
- Silences macOS Bash deprecation warning (`BASH_SILENCE_DEPRECATION_WARNING=1`).
- Git-aware prompt when `__git_ps1` is available.
- Large Bash history plus eternal log in `~/.bash_eternal_history`.
- Homebrew environment:
  - interactive shells: `brew shellenv`
  - non-interactive/fallback: safe PATH prepend of `/opt/homebrew/bin` and `/opt/homebrew/sbin`
- Optional tmux shortcuts enabled only if `tmux` is installed.

## Shortcuts

### Aliases

- `df` -> `df -h`
- `du` -> `du -h`
- `grep` -> `grep --color=auto`
- `ls` -> `ls -G`
- `ll` -> `ls -hl`
- `la` -> `ls -hla`
- `lt` -> `ls -hlart`
- `c` -> `clear`

### tmux helpers (only when tmux is installed)

- `mux` -> attach current tmux session or create one
- `ms` -> reload `~/.tmux.conf`
- `ml` -> list tmux sessions
- `mk` -> prompt, then kill all tmux sessions if confirmed

### Functions

- `mcd <dir>`: create directory and enter it

## Notes

- If prompt git branch is missing, install/enable Bash git completion so `__git_ps1` is available.
- If Homebrew is not installed, the script still adds common Apple Silicon Homebrew paths.
- `mk` is intentionally destructive and now asks for confirmation.
