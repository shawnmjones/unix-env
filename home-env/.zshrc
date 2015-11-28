#
## Source Prezto, if present
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    #echo "prezto messes with tmux, not launching"
    echo "prezto found, launching prezto"
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    #source "${ZDOTDIR:-$HOME}/.zshrc-default" 
else
    echo "no prezto found"
    source "${ZDOTDIR:-$HOME}/.zshrc-default" 
fi
