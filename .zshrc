# Editor
export EDITOR='nvim'

# Zoxide
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init --cmd cd zsh)"

# Node version manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Oh-My-Posh
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/config.toml)"

# zsh-autosuggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
# zsh-synax-highlighting
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

## Alisases
alias nv="nvim"
alias zshconfig="nv ~/.zshrc"
# ls
alias ls="ls --color"
alias ll="ls -alF"
alias l= "ls -CF"
alias la="ls -A"

# Homebrew
export HOMEBREW_AUTO_UPDATE_SECS=86400
