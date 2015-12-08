#
# Executes commands at logout
#

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${HOME}/.zprezto/runcoms/zlogout"
fi
