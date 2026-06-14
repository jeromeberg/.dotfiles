export ZDOTDIR="$HOME/.config/zsh"

# Rust/Cargo env
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Local zshenv
[ -f "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"