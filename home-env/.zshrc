# Source Prezto, if present
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
else
    echo "no prezto found"
    source "${ZDOTDIR:-$HOME}/.zshrc-default" 
fi
