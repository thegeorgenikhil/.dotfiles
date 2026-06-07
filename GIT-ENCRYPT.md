# Encrypting secrets in this repo (git-crypt + GPG)

This repo is **public**. Sensitive files (e.g. `zsh/.work_aliases.zsh`) are committed
**encrypted** with [git-crypt](https://github.com/AGWA/git-crypt), unlocked via a GPG key.
On your own machine the working tree is decrypted, so stow/sourcing works normally.

## 0. Prerequisites

```bash
brew install git-crypt gnupg
```

## 1. Generate a GPG key (once, per identity)

```bash
gpg --full-generate-key
# Choose: (9) ECC sign+encrypt → Curve 25519 → no expiry (or set one) → name + email
```

List your keys (commands below reference the key by its email / UID):

```bash
gpg --list-secret-keys --keyid-format=long
# uid   Your Name <you@example.com>   ← the email identifies the key
```

## 2. Back up your GPG private key (DO THIS — losing it = losing access)

Export the secret key and store it somewhere safe **outside the repo** (password
manager, encrypted USB). Anyone with this file can decrypt every secret.

```bash
gpg --export-secret-keys -a "you@example.com" > ~/gpg-private-backup.asc
gpg --export-ownertrust > ~/gpg-ownertrust-backup.txt   # optional: preserves trust
# Store both securely, then delete the plaintext copies from disk.
```

Restore on a new machine:

```bash
gpg --import ~/gpg-private-backup.asc
gpg --import-ownertrust ~/gpg-ownertrust-backup.txt
```

## 3. Initialize git-crypt in the repo (once)

```bash
git-crypt init                              # creates the repo's encryption key
git-crypt add-gpg-user "you@example.com"     # authorizes your GPG key (makes a commit)
```

To authorize an additional GPG key later (another machine/identity), just run
`add-gpg-user` again with that key ID.

## 4. Mark a file for encryption

Add a pattern to `.gitattributes` **before** staging the file:

```bash
echo 'zsh/.work_aliases.zsh filter=git-crypt diff=git-crypt' >> .gitattributes
```

## 5. Commit (the filter encrypts it on the way in)

```bash
git add .gitattributes .gitignore zsh/.work_aliases.zsh
git commit -m "add: encrypted work aliases"
```

## 6. Verify BEFORE pushing (safety net)

```bash
git-crypt status -e                                 # lists files marked encrypted
git show HEAD:zsh/.work_aliases.zsh | head -c 16     # must show binary "GITCRYPT", not plaintext
```

If `git show` prints your real file contents, **do not push** — the filter wasn't
active when you staged. Fix `.gitattributes`, then re-run the filter:

```bash
git rm --cached zsh/.work_aliases.zsh
git add zsh/.work_aliases.zsh
git commit --amend
```

Then push:

```bash
git push
```

## 7. Working with the repo on a new machine

Order matters — **unlock before stow/source**, or your shell will try to source
an encrypted blob.

```bash
git clone git@github.com:thegeorgenikhil/.dotfiles.git
cd .dotfiles
gpg --import ~/gpg-private-backup.asc   # if not already imported (step 2)
git-crypt unlock                        # decrypts the working tree using your GPG key
stow zsh                                 # now safe to symlink
```