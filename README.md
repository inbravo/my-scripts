# my-scripts

A personal collection of day-to-day shell scripts and dotfiles, version-controlled and symlinked into the system for easy management across machines.

---

## Repository structure

```
my-scripts/
├── dotfiles/           # Shell config files (symlinked to ~/)
│   ├── .zprofile       # PATH, JAVA_HOME, Homebrew, Python, Hadoop env vars
│   ├── .zshrc          # Conda init (managed by conda init)
│   ├── .zsh_aliases    # Custom shell aliases
│   ├── .bash_profile   # Conda init for Bash
│   ├── .profile        # LM Studio, Rust env
│   └── .gitconfig      # Git identity, LFS, global gitignore
├── shell/              # Shell productivity scripts
├── git/                # Git helpers
├── dev/                # Docker and development tooling
├── system/             # macOS system maintenance
├── network/            # VPN and network utilities
├── utils/              # General-purpose utilities
├── Makefile            # Install / uninstall / list commands
└── .gitignore
```

---

## Setup on a new machine

### 1. Clone the repo

```bash
git clone https://github.com/inbravo/my-scripts.git ~/GitHub/my-scripts
cd ~/GitHub/my-scripts
```

### 2. Symlink dotfiles to your home directory

```bash
make install-dotfiles
```

This will:
- Symlink each file in `dotfiles/` to `~/`
- Back up any existing file as `~/<filename>.bak` before replacing it

Reload your shell after:

```bash
source ~/.zprofile
```

### 3. Symlink scripts to `/usr/local/bin` (makes them globally callable)

```bash
sudo make install-scripts
```

After this you can call any script by name from anywhere, e.g.:

```bash
vpn start
docker-cleanup
brew-update
git-cleanup
```

### 4. Install everything in one command

```bash
sudo make install
```

---

## Editing dotfiles

Because the files in `~/` are symlinks pointing into this repo, you can edit them in either location — they are the same file.

**Preferred:** edit directly in the repo so git context is obvious:

```
~/GitHub/my-scripts/dotfiles/.zsh_aliases
```

Then commit:

```bash
cd ~/GitHub/my-scripts
git add dotfiles/.zsh_aliases
git commit -m "Add new alias"
```

> **Never edit `.zshrc` or `.bash_profile` manually** — those are managed by `conda init` and will be rewritten by Conda when you run `conda init`.

---

## Adding a new script

1. Create the script in the appropriate folder:

```bash
touch shell/my-script.sh
chmod +x shell/my-script.sh
```

2. Symlink it to `/usr/local/bin`:

```bash
sudo make install-scripts
```

3. Commit it:

```bash
git add shell/my-script.sh
git commit -m "Add my-script"
```

---

## Makefile reference

| Command | Description |
|---|---|
| `make install` | Symlink dotfiles + scripts (requires sudo for scripts) |
| `make install-dotfiles` | Symlink dotfiles to `~/` only |
| `sudo make install-scripts` | Symlink scripts to `/usr/local/bin` |
| `make uninstall` | Remove all dotfile symlinks from `~/` |
| `make list` | Show symlink status of all tracked dotfiles |

---

## Available scripts

| Script | Location | Description |
|---|---|---|
| `reload` | `shell/` | Reload zsh config without restarting terminal |
| `git-cleanup` | `git/` | Delete local branches already merged into main |
| `docker-cleanup` | `dev/` | Prune stopped containers, images, volumes, networks |
| `brew-update` | `system/` | Update and upgrade all Homebrew packages |
| `vpn` | `network/` | Start / stop GlobalProtect VPN (`vpn start`, `vpn stop`) |
| `find-large-files` | `utils/` | List top 20 largest files in a directory |
