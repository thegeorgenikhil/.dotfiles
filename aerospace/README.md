# AeroSpace Configuration

This is the AeroSpace configuration for my macOS setup.

## Enabled Workspaces

- 1
- 2
- 3
- E
- G
- M
- O
- P
- T

## Most Used Keybindings

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

> **Note:** `alt + shift + m` and `t` will launch Spotify and Telegram.

## Custom Keybindings

| Keybinding        | Action                              |
| ----------------- | ----------------------------------- |
| `alt + f`         | Toggle focused window to fullscreen |
| `alt + shift + m` | Launch Spotify app                  |
| `alt + shift + t` | Launch Telegram app                 |

## Automatic Window → Workspace Assignment

The following applications are assigned to specific workspaces upon launch:

| Application(s) | Workspace |
| -------------- | --------- |
| Google Chrome  | 1         |
| Cursor / Zed   | E         |
| Ghostty        | G         |
| Spotify        | M         |
| Telegram       | T         |

## Workspace → Monitor Assignment

Workspaces are pinned to dedicated monitors in a dual-display setup, giving each screen a consistent purpose — the external monitor for coding and browsing, the laptop screen for media and personal use.

Run `aerospace list-monitors` to get the exact monitor names to use in the config.

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
