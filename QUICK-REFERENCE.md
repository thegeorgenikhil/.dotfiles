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
| `alt + shift + m` | Launch Spotify app                  |
| `alt + shift + t` | Launch Telegram app                 |

### Automatic Window → Workspace Assignment

| Application(s) | Workspace |
| -------------- | --------- |
| Google Chrome  | 1         |
| Cursor / Zed   | E         |
| Ghostty        | G         |
| Spotify        | M         |
| Telegram       | T         |

### Workspace → Monitor Assignment

> Run `aerospace list-monitors` to get the exact monitor names to use in the config.

| Workspace | Monitor                 | Typical Use         |
| --------- | ----------------------- | ------------------- |
| 1         | DELL P2422HE            | Chrome              |
| 2         | DELL P2422HE            | Chrome              |
| 3         | Built-in Retina Display | Chrome              |
| E         | DELL P2422HE            | Editor (Cursor/Zed) |
| G         | DELL P2422HE            | Ghostty             |
| O         | DELL P2422HE            | Scratch             |
| T         | DELL P2422HE            | Telegram            |
| M         | Built-in Retina Display | Spotify             |
| P         | Built-in Retina Display | Personal            |

> **Note:** When only the built-in display is connected, AeroSpace falls back and shows all workspaces on that single monitor.

---

## Ghostty

| Keybinding              | Action                          |
| ----------------------- | ------------------------------- |
| `⌘ C` / `⌘ V`           | Copy / paste                    |
| `⌘ T`                   | New tab                         |
| `⌘ W`                   | Close tab / split (surface)     |
| `⌘ Shift + [` / `]`     | Previous / next tab             |
| `⌘ 1`…`8`               | Go to tab N                     |
| `⌘ D`                   | New split (right)               |
| `⌘ Shift + D`           | New split (down)                |
| `⌘ [` / `]`             | Focus previous / next split     |
| `⌘ Alt + ←↓↑→`          | Focus split by direction        |
| `⌘ =` / `⌘ -`           | Increase / decrease font size   |
| `⌘ 0`                   | Reset font size                 |
| `⌘ K`                   | Clear screen                    |
| `⌘ Shift + ,`           | Reload config                   |

---

## Hunk

| Keybinding   | Action                  |
| ------------ | ----------------------- |
| `[` / `]`    | Previous / next hunk    |
| `1` / `2` / `0` | View: split / stack / auto |
| `s`          | Toggle sidebar          |
| `/`          | Focus file filter       |

---

## zsh

> Defined in [`zsh/.zshrc`](zsh/.zshrc).

| Keybinding   | Action                                          |
| ------------ | ----------------------------------------------- |
| `Ctrl-X Ctrl-E` | Edit the current command line in Vim (`edit-command-line`) |
