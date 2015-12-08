#
# Executes commands at login post-zshrc.
#

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${HOME}/.zprezto/runcoms/zlogin"
fi
