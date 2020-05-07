# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_DISABLE_COMPFIX=true
ZSH_THEME="pi"
# PLUGINS
plugins=(
	git 
	zsh-syntax-highlighting
)
# OPTIONS
bindkey -v
export TERM=screen-256color
source $ZSH/oh-my-zsh.sh
