# homebrew
#if command -v brew >/dev/null 2>&1; then
#	eval "$(brew shellenv)"
#	_brew_prefix="$(brew --prefix)"
#fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# bins
case ":$PATH:" in
	*":$HOME/.local/bin:"*) ;;
	*) [ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH" ;;
esac

# completion
zmodload -i zsh/complist
autoload -Uz compinit
if [[ -n "$HOME/.zcompdump"(#qN.mh+24) ]]; then
	compinit -d "$HOME/.zcompdump"
else
	compinit -C -d "$HOME/.zcompdump"
fi
setopt complete_in_word
setopt list_packed
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors 'di=34:ln=36:ex=32'

# shift-tab completion
bindkey '^[[Z' reverse-menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete

# colors
export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"

# history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt histignoredups
setopt histignorespace
setopt hist_reduce_blanks
setopt hist_verify
setopt hist_save_no_dups
setopt hist_find_no_dups

# navigation
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

hash -d dev=~/Developer  # ~dev
hash -d dl=~/Downloads   # ~dl
hash -d dot=~/.dotfiles  # ~dot
hash -d dsk=~/Desktop    # ~dsk

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# shell
setopt interactive_comments
setopt no_beep
setopt no_flow_control
bindkey -v

# prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{blue}(%b)%f'
setopt PROMPT_SUBST
PROMPT='%B%~${vcs_info_msg_0_} $ %b'

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# vim
export EDITOR='vim'
export VISUAL="$EDITOR"

# === ALIASES === #

# network
alias ip='ipconfig getifaddr en0'  # local ip en0, macOS

# restic
alias backup='bash ~/.dotfiles/tools/restic/backup.sh'

# bear
alias bearcli='/Applications/Bear.app/Contents/MacOS/bearcli'

# python
alias python='python3'
alias pip='pip3'

# git
alias g='git'
alias gb='git branch'
alias ga='git add'
alias gcm='git commit -m'
alias gf='git fetch'
alias gp='git pull'
alias gpush='git push'
alias gforce='git push --force-with-lease'
alias gs='git status -sb'
alias gcl='git clone --recurse-submodules'
alias glog='git log --oneline --decorate --graph'
alias glast='git log -1 HEAD --stat'

# cp / mv / rm
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# ls
alias lsa='ls -A'
alias lsl='ls -l'
alias lsla='ls -lA'

# misc
alias grep='grep --color=auto'
alias tree='tree -a -I ".git|.DS_Store|.claude"'
alias reload='source ~/.config/zsh/.zshrc'
alias cls='clear'
alias h='history'

# mkcd: create dir and cd into it
mkcd() { mkdir -p "$1" && cd "$1"; }

# === MISC === #

# Platformio

export PLATFORMIO_PROJECT_DIR="$HOME/Developer/platformio"

_pio_bin="$HOME/.platformio/penv/bin"
case ":$PATH:" in
	*":$_pio_bin:"*) ;;
	*) [ -d "$_pio_bin" ] && export PATH="$_pio_bin:$PATH" ;;
esac
unset _pio_bin

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="\
  --height=90% \
  --layout=reverse \
  --border=rounded \
  --preview 'bat --color=always --style=numbers --line-range=:100 {}' \
  --preview-window=right:50%:wrap \
  --color=fg:#cdd6f4,fg+:#cdd6f4,bg:#1e1e2e,bg+:#313244 \
  --color=hl:#89b4fa,hl+:#89b4fa,info:#cba6f7,prompt:#cba6f7 \
  --color=pointer:#f5c2e7,marker:#a6e3a1,spinner:#f5c2e7,border:#6c7086"

# zoxide
eval "$(zoxide init zsh)"

# === PLUGINS === #

if [[ -n "$_brew_prefix" ]]; then
	[ -r "$_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && \
		source "$_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
	[ -r "$_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
		source "$_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	unset _brew_prefix
fi

# === local zshrc === #
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
