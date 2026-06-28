# Quick Reference

A personal cheat sheet of the commands and keybindings I reach for most across my dotfiles setup. Whenever I forget how to do something, this is the single place to look it up.

---

## AeroSpace

### Most Used Keybindings

| Keybinding                          | Action                                                     |
| ----------------------------------- | ---------------------------------------------------------- |
| `alt + h` / `j` / `k` / `l`         | Focus left / down / up / right                             |
| `alt + shift + h` / `j` / `k` / `l` | Move focused window left / down / up / right               |
| `alt + <workspace>`                 | Switch to the corresponding enabled workspace              |
| `alt + shift + <workspace>`         | Move focused window to the corresponding enabled workspace |
| `alt + /`                           | Cycle between horizontal and vertical tiling               |
| `alt + ,`                           | Switch to accordion mode (stacked window layout)           |
| `alt + -`                           | Shrink window                                              |
| `alt + =`                           | Grow window                                                |
| `alt + tab`                         | Switch to previous workspace                               |
| `alt + shift + ;`                   | Enter service mode                                         |
| `service mode → r`                  | Reset layout                                               |
| `service mode → f`                  | Toggle focused window floating / tiling                    |
| `service mode → esc`                | Reload config and exit service mode                        |

### Custom Keybindings

| Keybinding        | Action                              |
| ----------------- | ----------------------------------- |
| `alt + f`         | Toggle focused window to fullscreen |
| `alt + shift + 2` | Launch Slack app                    |
| `alt + shift + m` | Launch Spotify app                  |
| `alt + shift + t` | Launch Telegram app                 |

### Automatic Window → Workspace Assignment

| Application(s)             | Workspace |
| -------------------------- | --------- |
| Google Chrome              | A         |
| Slack                      | 2         |
| Cursor / Zed / Zed Preview | E         |
| Ghostty                    | G         |
| Spotify                    | M         |
| Telegram                   | T         |

### Workspace → Monitor Assignment

> Run `aerospace list-monitors` to get the exact monitor names to use in the config.

| Workspace | Monitor                 | Typical Use                     |
| --------- | ----------------------- | ------------------------------- |
| 1         | LG HDR 4K               | Standby                         |
| 2         | LG HDR 4K               | Slack                           |
| 3         | Built-in Retina Display | Standby                         |
| A         | LG HDR 4K               | Main Chrome                     |
| E         | LG HDR 4K               | Editor (Cursor/Zed/Zed Preview) |
| G         | LG HDR 4K               | Ghostty                         |
| O         | LG HDR 4K               | Scratch                         |
| T         | LG HDR 4K               | Telegram                        |
| M         | Built-in Retina Display | Spotify                         |
| P         | Built-in Retina Display | Personal                        |

> **Note:** When only the built-in display is connected, AeroSpace falls back and shows all workspaces on that single monitor.

---

## Mouseless

> Default keybindings (macOS). Press `Tab` while the overlay is up to edit the config.

### Modes & overlay

| Keybinding                                | Action                               |
| ----------------------------------------- | ------------------------------------ |
| `⌘ Left` (tap)                            | Show overlay                         |
| `Esc`                                     | Hide overlay / close UI element      |
| `Option Left` (tap)                       | Toggle free mode (relative movement) |
| `Tab` (overlay up)                        | Edit config                          |
| `Shift Left` / `Shift Right` (overlay up) | Move overlay to prev / next monitor  |

### Overlay mode (clicking)

| Keybinding                                | Action                            |
| ----------------------------------------- | --------------------------------- |
| Type 2 cell chars, then `Space`           | Click at cell center              |
| Type 2 cell chars, then subgrid char      | Click at sub-cell                 |
| `Space` (during selection)                | Click at virtual cursor           |
| `Backspace`                               | Undo last key (go back one level) |
| Hold `Shift` (or `⌘ Right`) + final key   | Right click                       |
| Repeat final key                          | Double / triple click             |
| Hold `Option Left` (`⌘ Left`) + final key | Begin click-and-drag              |
| `Option Left` (tap, overlay up)           | Move cursor (no click)            |

### Free mode (relative movement)

| Keybinding             | Action                                            |
| ---------------------- | ------------------------------------------------- |
| `I` / `K` / `J` / `L`  | Move up / down / left / right                     |
| `Space`                | Left click                                        |
| `R` / `E`              | Right click / middle click                        |
| `Q` / `W`              | Back / forward click                              |
| `M` / `,`              | Scroll up / down                                  |
| `.` / `/`              | Scroll left / right                               |
| `S` / `D` / `F` (hold) | Increase movement / scroll speed (stack for more) |
| `A` (hold)             | Decrease speed                                    |

---

## Ghostty

| Keybinding          | Action                        |
| ------------------- | ----------------------------- |
| `⌘ C` / `⌘ V`       | Copy / paste                  |
| `⌘ T`               | New tab                       |
| `⌘ W`               | Close tab / split (surface)   |
| `⌘ Shift + [` / `]` | Previous / next tab           |
| `⌘ 1`…`8`           | Go to tab N                   |
| `⌘ D`               | New split (right)             |
| `⌘ Shift + D`       | New split (down)              |
| `⌘ [` / `]`         | Focus previous / next split   |
| `⌘ Alt + ←↓↑→`      | Focus split by direction      |
| `⌘ =` / `⌘ -`       | Increase / decrease font size |
| `⌘ 0`               | Reset font size               |
| `⌘ K`               | Clear screen                  |
| `⌘ Shift + ,`       | Reload config                 |

---

## Hunk

| Keybinding      | Action                     |
| --------------- | -------------------------- |
| `[` / `]`       | Previous / next hunk       |
| `1` / `2` / `0` | View: split / stack / auto |
| `s`             | Toggle sidebar             |
| `/`             | Focus file filter          |

---

## zsh

> Defined in [`zsh/.zshrc`](zsh/.zshrc).

| Keybinding      | Action                                                     |
| --------------- | ---------------------------------------------------------- |
| `Ctrl-X Ctrl-E` | Edit the current command line in Vim (`edit-command-line`) |
