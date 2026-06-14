# Homebrew-first PATH setup for macOS without touching system Python.
# Check known install paths directly — brew isn't in PATH yet at this point.
if [ -x "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x "/usr/local/bin/brew" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Common user bin directories (only if present).
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

# Optional OrbStack shell integration (if installed).
source "$HOME/.orbstack/shell/init.zsh" 2>/dev/null || :

# Optional per-machine PATH and env customizations.
[ -f "$HOME/.zprofile.local" ] && source "$HOME/.zprofile.local"
