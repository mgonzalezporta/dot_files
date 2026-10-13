# tmux Shortcuts

All tmux shortcuts in one place: the key bindings defined in `dot_tmux.conf`, and the shell helpers defined in the `dot_setup_*.sh` scripts.

## Install

Link the config so edits in this repo apply after a reload:

```bash
ln -s ~/Documents/ai-projects/dot_files/dot_tmux.conf ~/.tmux.conf
```

Inside a running tmux session, reload with `Prefix r` (or `ms` from the shell).

On macOS, also free up the `Ctrl`-arrow keys (see [macOS setup](#macos-setup)).

## Conventions

- **Prefix** is the tmux default, `Ctrl-b`; the config does not change it. `Prefix r` means press `Ctrl-b`, release, then `r`.
- Shortcuts written without a prefix (e.g. `Ctrl-s`) are bound with `bind-key -n` and work directly, with no prefix.

## Shell helpers

Typed at the shell prompt, inside or outside tmux. Defined in every `dot_setup_*.sh` script and in `setup_nscc_gonzalez.sh`.

| Command | Action                                               |
| ------- | ---------------------------------------------------- |
| `mux`   | Attach to the last tmux session, or start a new one  |
| `ms`    | Reload `~/.tmux.conf`                                |
| `ml`    | List all sessions                                    |
| `mk`    | Kill **all** sessions                                |

`mk` asks for confirmation only on the EBI MacBook (`dot_setup_ebi_pro.sh`). On the other machines it kills everything immediately.

## General

| Shortcut   | Action                                                     |
| ---------- | ---------------------------------------------------------- |
| `Prefix r` | Reload `~/.tmux.conf` and confirm it                       |
| `Prefix d` | Detach (tmux default); reattach later with `mux`           |
| `Prefix ?` | List every key binding (tmux default)                      |
| Mouse      | Click to select panes and windows, drag to resize, scroll  |

## Sessions

| Shortcut              | Action                                              |
| --------------------- | --------------------------------------------------- |
| `Ctrl-s`              | New session                                         |
| `Ctrl-f`              | Switch to a session by name or number               |
| `Prefix (` / `Prefix )` | Previous / next session (tmux default)            |
| `Prefix s`            | Rename the current session                          |
| `Prefix k`            | Kill a session (prompts for its name)               |
| `ml`                  | List sessions (shell)                               |

For an interactive session picker: `Prefix :`, then `choose-tree -s`.

## Windows (tabs)

| Shortcut             | Action                                               |
| -------------------- | ---------------------------------------------------- |
| `Ctrl-w`             | New window                                           |
| `Prefix w`           | Rename the current window                            |
| `Ctrl-Shift-Left`    | Previous window                                      |
| `Ctrl-Shift-Right`   | Next window                                          |
| `Prefix Shift-Left`  | Move the current window one place left (repeatable)  |
| `Prefix Shift-Right` | Move the current window one place right (repeatable) |

## Panes (splits)

| Shortcut                | Action                                                 |
| ----------------------- | ------------------------------------------------------ |
| `Ctrl-p`                | Split side by side, opening in the current directory   |
| `Ctrl-o`                | Split top and bottom, opening in the current directory |
| `Ctrl-z`                | Toggle zoom on the current pane                        |
| `Ctrl-Left` / `Ctrl-h`  | Move to the pane on the left                           |
| `Ctrl-Down` / `Ctrl-j`  | Move to the pane below                                 |
| `Ctrl-Up` / `Ctrl-k`    | Move to the pane above                                 |
| `Ctrl-Right` / `Ctrl-l` | Move to the pane on the right                          |
| `Ctrl-\`                | Move to the previously active pane                     |

The `Ctrl-h/j/k/l/\` keys follow [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): if the current pane is running Vim or Neovim, the key is passed through so Vim can move between its own splits. The same keys also work in copy mode. The `Ctrl`-arrow keys always move between tmux panes, even inside Vim.

## macOS setup

macOS claims every `Ctrl`-arrow key by default, so they never reach tmux.

1. System Settings → Keyboard → Keyboard Shortcuts… → Mission Control. Untick *Move left a space*, *Move right a space*, *Mission Control* and *Application windows*.
2. Unticking the "space" shortcuts leaves two hidden companions enabled, bound to `Ctrl-Shift-Left/Right`. Turn them off from the terminal:

   ```bash
   defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 80 '<dict><key>enabled</key><false/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>123</integer><integer>8781824</integer></array><key>type</key><string>standard</string></dict></dict>'
   ```

   ```bash
   defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 82 '<dict><key>enabled</key><false/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>124</integer><integer>8781824</integer></array><key>type</key><string>standard</string></dict></dict>'
   ```

   ```bash
   /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
   ```

   If the keys still don't reach tmux, log out and back in.

To check that a key gets through, run `cat -v` outside tmux and press it: `Ctrl-Shift-Right` should print `^[[1;6C`. iTerm's default profile sends all of these without extra configuration.

## Notes

- **Shell and terminal keys are taken over.** Because these bindings need no prefix, tmux intercepts them before the shell sees them. Inside tmux you lose `Ctrl-w` (delete word), `Ctrl-z` (suspend job), `Ctrl-l` (clear screen), `Ctrl-p` (previous command), `Ctrl-o`, `Ctrl-s` and `Ctrl-f`. Workarounds: run `c` or `clear` instead of `Ctrl-l`; use the up arrow for history.
- **Three tmux defaults are replaced.** `Prefix s` and `Prefix w` normally open the session and window pickers; here they rename instead. `Prefix Shift-arrow` normally scrolls the view (`refresh-client`), which only matters when attaching from a smaller terminal.
- **Prompt and aliases missing in a tmux pane?** The pane's shell skipped your bash setup. Run `exec bash -l` in it, or open a new pane.

## Other settings

- Status bar right side shows date, time and hostname, e.g. `13-Oct-2026 10:30 (hostname)`.
- 256-colour and true-colour support (`xterm-256color` with `Tc` override).
- `xterm-keys` on, so modified arrow keys work.
