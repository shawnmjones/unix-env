#
# Executes commands at login post-zprofile
#

## Source Prezto, if present
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    echo "prezto found, launching prezto"
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
else
    echo "no prezto found"
    source "${ZDOTDIR:-$HOME}/.zshrc-default" 
fi
