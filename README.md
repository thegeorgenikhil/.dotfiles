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
need to hardlink the config into the app's config location:

```bash
ln ~/.config/mouseless/config.yaml \
   "$HOME/Library/Application Support/Mouseless/configs/config.yaml"
```

### tuna

Like mouseless, Tuna reads its config from its Application Support directory, not
the stowed location, so after `stow tuna` hardlink the config in:

```bash
ln ~/.config/tuna/config.toml \
   "$HOME/Library/Application Support/Tuna/config.toml"
```