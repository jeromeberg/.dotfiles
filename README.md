# .dotfiles

My config files and scripts for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html).

## Included

- Brewfile (brew bundle)
- ZSH config, plugins and aliases
- [yabai](https://github.com/asmvik/yabai) config (tiling window manager)
- [skhd](https://github.com/asmvik/skhd) config (hotkey daemon for yabai)
- [iterm2](https://iterm2.com/) config
- git config, global gitignore and aliases
- macOS `defaults.sh` settings script
- stats config (menu bar system monitor)
- vim config
- [restic](https://restic.net/) (backup) scripts

## Structure

```
.
├── .config/
│   ├── git/
│   ├── skhd/
│   ├── yabai/
│   └── zsh/
├── .vimrc
├── Library/LaunchAgents/
└── tools/
    ├── Brewfile
    ├── defaults.sh
    ├── iterm2/
    ├── restic/
    └── stats/
```

## Quick start

```bash
# 1. install xcode CLT (required by homebrew)
xcode-select --install

# 2. install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2b. load homebrew into current shell
eval "$(/opt/homebrew/bin/brew shellenv)"

# 3. clone .dotfiles in HOME
git clone https://github.com/jeromeberg/.dotfiles ~/dotfiles

# 4. install packages from Brewfile
brew bundle --file ~/dotfiles/tools/Brewfile

# 5. stow
cd ~/dotfiles && stow .
```

### macOS defaults

```bash
# apply macOS defaults
bash ~/dotfiles/tools/defaults.sh

# logout to apply defaults
logout
```

## Configuration

### Restic

Automatic backup to NAS. 
Runs every 24h via launchd script.

```bash
# add password using keychain
security add-generic-password -a jerome -s restic -w "strong_password"

# edit variables in .env.sh
export RESTIC_REPOSITORY=/Volumes/Freebox/Backups/jerome
export RESTIC_PASSWORD_COMMAND="security find-generic-password -a jerome -s restic -w"

# init restic repo
restic init
```

**Manual backup**

```bash
backup
```

**Check snapshots**

```bash
source ~/.dotfiles/tools/restic/env.sh
restic snapshots
```

### ZSH

<details>
<summary>Features</summary>

- Native completion
- History and navigation options
- Colors
- Homebrew, fzf, and zoxide setup
- Git branch in PROMPT
- Platformio setup
- Local override file (`~/.zshrc.local`)
- Plugins: `zsh-autosuggestions`, `zsh-syntax-highlighting`
</details>

<details>
<summary>General aliases</summary>

- `ip`: local ip (en0)
- `backup`: manual restic backup
- `lsa`: `ls -A`
- `lsl`: `ls -l`
- `lsla`: `ls -lA`
- `cls`: clear screen
- `h`: history
- `reload`: reload `.zshrc` file
- `mkcd`: mkdir + cd in new directory
- `..`, `...` and `....` aliases
</details>

<details>
<summary>Git aliases in zsh</summary>

- `gb`: branch
- `ga`: add
- `gcm`: `git commit -m`
- `gf`: fetch
- `gp`: pull
- `gpush`: push
- `gforce`: push force-with-lease
- `gs`: status
- `gcl`: clone repo
- `glog`: pretty logs
- `glast`: show last commit
</details>

### Git

<details>
<summary>Features</summary>

- Global configuration in `~/.config/git/config`
- Global gitignore file
- Safer line endings on macOS
- Auto upstream on first push
- Better merge conflict markers, diff readability
- Rebase with autostash
</details>

<details>
<summary>Aliases</summary>

- `pretty`: graph log with decorations
- `unstage`: unstage
- `unstage-all`: unstage all files
- `undo`: undo last commit, keep changes
- `last`: show last commit with stats
- `s`: short status
- `aliases`: list configured aliases
- `cleanup`: delete local branches already merged into `main`
- `cm`: `git commit -m`
- `force`: push --force-with-lease
</details>

### Yabai

Tiling window manager for macOS.

```bash
# start
yabai --start-service
skhd --start-service

# restart
yabai --restart-service
skhd --restart-service

# stop
yabai --stop-service
skhd --stop-service
```

<details>
<summary>Shortcuts</summary>

| Keys | Action |
|---|---|
| `alt + h/j/k/l` | Focus window |
| `alt + s/g` | Focus display left/right |
| `shift + alt + r` | Rotate layout clockwise | 
| `shift + alt + y` | Mirror y-axis | 
| `shift + alt + x` | Mirror x-axis |
| `shift + alt + t` | Toggle float | 
| `shift + alt + m` | Toggle zoom fullscreen | 
| `shift + alt + e` | Balance layout |
| `shift + alt + h/j/k/l` | Swap window |
| `ctrl + alt + h/j/k/l` | Warp (move + split) | 
| `shift + alt + s/g` | Move window to display left/right |
| `shift + alt + p/n` | Move window to previous/next space |

</details>

### iTerm2

Terminal emulator for macOS.

1. Open **iTerm2** -> **Settings** -> **General** -> **Preferences**.
2. Enable "**Load preferences from a custom folder or URL**".
3. Set the folder to `~/.dotfiles/tools/iterm2`.

### Stats

Menu bar system monitor for macOS.

1. Open Stats settings
2. Import `~/.dotfiles/tools/stats/Stats.plist`
