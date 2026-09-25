if [[ -f "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi

alias cd="z"
alias ls="eza"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
#eval "$(fnm env --use-on-cd --shell zsh)"

export MANPAGER="nvim +Man!"
export GROFF_NO_SGR=1

export PATH="$HOME/neovim/bin:$PATH"

for dir in $fpath; do
    if [[ -f "$dir/zsh-syntax-highlighting.zsh" ]]; then
        source "$dir/zsh-syntax-highlighting.zsh"
        break
    fi
done


for dir in $fpath; do
    if [[ -f "$dir/zsh-autosuggestions.zsh" ]]; then
        source "$dir/zsh-autosuggestions.zsh"
        break
    fi
done


