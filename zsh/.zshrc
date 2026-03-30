. "$HOME/.cargo/env"

alias cd="z"
alias ls="eza"
alias asus-per="asusctl profile set Performance"
alias asus-bal="asusctl profile set Balanced"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
#eval "$(fnm env --use-on-cd --shell zsh)"

export MANPAGER="nvim +Man!"
export GROFF_NO_SGR=1


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
