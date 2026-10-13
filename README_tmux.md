# tmux Shortcuts

Keyboard shortcuts defined in `dot_tmux.conf`.

## Install

```bash
cp dot_tmux.conf ~/.tmux.conf
```

Inside a running tmux session, reload with `Prefix r`.

## Conventions

- **Prefix** is the tmux default, `Ctrl-b`; the config does not change it. `Prefix r` means press `Ctrl-b`, release, then `r`.
- Shortcuts written without a prefix (e.g. `Ctrl-s`) are bound with `bind-key -n` and work directly, with no prefix.

## General

| Shortcut   | Action                                  |
| ---------- | --------------------------------------- |
| `Prefix r` | Reload `~/.tmux.conf` and confirm it    |
| Mouse      | Click to select panes and windows, drag to resize, scroll |

## Sessions

| Shortcut   | Action                                        |
| ---------- | --------------------------------------------- |
| `Ctrl-s`   | New session                                   |
| `Ctrl-f`   | Find a session by name and switch to it       |
| `Prefix s` | Rename the current session                    |
| `Prefix k` | Kill a session (prompts for its name)         |

## Windows (tabs)

| Shortcut           | Action                                  |
| ------------------ | --------------------------------------- |
| `Ctrl-w`           | New window                              |
| `Prefix w`         | Rename the current window               |
| `Ctrl-Left`        | Previous window                         |
| `Ctrl-Right`       | Next window                             |
| `Ctrl-Shift-Left`  | Move the current window one place left  |
| `Ctrl-Shift-Right` | Move the current window one place right |

## Panes (splits)

| Shortcut | Action                                                    |
| -------- | --------------------------------------------------------- |
| `Ctrl-p` | Split side by side, opening in the current directory      |
| `Ctrl-o` | Split top and bottom, opening in the current directory    |
| `Ctrl-z` | Toggle zoom on the current pane                           |
| `Ctrl-h` | Move to the pane on the left                              |
| `Ctrl-j` | Move to the pane below                                    |
| `Ctrl-k` | Move to the pane above                                    |
| `Ctrl-l` | Move to the pane on the right                             |
| `Ctrl-\` | Move to the previously active pane                        |

The `Ctrl-h/j/k/l/\` keys follow [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): if the current pane is running Vim or Neovim, the key is passed through so Vim can move between its own splits. The same keys also work in copy mode.

## Notes

- **Shell and terminal keys are taken over.** Because these bindings need no prefix, tmux intercepts them before the shell sees them. Inside tmux you lose `Ctrl-w` (delete word), `Ctrl-z` (suspend job), `Ctrl-l` (clear screen), `Ctrl-p` (previous command), `Ctrl-o`, `Ctrl-s` and `Ctrl-f`. Workarounds: run `clear` instead of `Ctrl-l`; use the up arrow for history.
- **Two tmux defaults are replaced.** `Prefix s` and `Prefix w` normally open the session and window pickers; here they rename instead. Use `Ctrl-f` to switch sessions by name, or `Prefix (` / `Prefix )` to cycle through them.
- **macOS:** `Ctrl-Left` / `Ctrl-Right` are claimed by Mission Control to switch Spaces. Turn those off under System Settings → Keyboard → Keyboard Shortcuts → Mission Control, or the window shortcuts will not reach tmux. `Ctrl-Shift-Left/Right` also depend on the terminal emulator sending them through.
- All other tmux defaults (e.g. `Prefix d` to detach, `Prefix [` for copy mode, `Prefix ?` to list every binding) still apply.

## Other settings

- Status bar right side shows date, time and hostname, e.g. `13-Oct-2026 10:30 (hostname)`.
- 256-colour and true-colour support (`xterm-256color` with `Tc` override).
- `xterm-keys` on, so modified arrow keys work.
