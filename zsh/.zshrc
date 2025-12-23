. "$HOME/.cargo/env"

alias cd="z"
alias ls="eza"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export MANPAGER="nvim +Man!"
export GROFF_NO_SGR=1

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
