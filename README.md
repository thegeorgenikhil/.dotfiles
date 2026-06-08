# dotfiles

Personal configuration files for macOS, managed with GNU Stow.

## Usage

From the repo root:

```bash
stow ghostty
```

Remove symlinks:

```bash
stow -D ghostty
```

Preview changes:

```bash
stow -n -v ghostty
```

### mouseless

mouseless doesn't read the stowed config directly, so after `stow mouseless` you
need to symlink the config into the app's sandbox container:

```bash
ln ~/.config/mouseless/config.yaml \
   "$HOME/Library/Containers/net.sonuscape.mouseless/Data/.mouseless/configs/config.yaml"
```
