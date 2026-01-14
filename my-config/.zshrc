# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias rc="vim ~/.zshrc && source ~/.zshrc"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
