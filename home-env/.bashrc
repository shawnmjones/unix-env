# .bashrc

# this file should be loaded by ~/.profile, and loads any bash-specific settings

# set the prompt to something useful depending on the terminal type
case $TERM in
  screen|screen.linux)
# I want to see when I'm running a screen session
    SH_MAJOR_VER=`echo $BASH_VERSION | sed 's/\([^.]\)*\..*$/\1/g'`
    if [ $SH_MAJOR_VER -lt 3 ]; then
      PS1='\n\t \u@\h:\w\nbash (screen)\$ --> '
    else
      PS1='\n\t \u@\h:\w\nbash (screen \l)\$ --> '
    fi
    PS2='> '
    PS3='$PS2 > '
    PS4='$PS3 > '
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
    ;;
  linux)
# linux terminal doesn't need the PROMPT_COMMAND, there're no Windows
    PS1='\n\t \u@\h:\w\nbash\$ --> '
    PS2='> '
    PS3='$PS2 > '
    PS4='$PS3 > '
    PROMPT_COMMAND=""
    ;;
  *)
# safer and more legible to go with something simple
    PS1='\n\t \u@\h:\w\nbash \$ --> '
    PS2='> '
    PS3='$PS2 > '
    PS4='$PS3 > '
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
    ;;
esac

# check the window size after executing commands so new
# commands get the current window size
shopt -s checkwinsize

# correct spelling mistakes
shopt -s cdspell

# save multiline commands in the command history
shopt -s cmdhist

# display filenames beginning with . for pathname expansions
shopt -s dotglob

# enable extended pattern matching features
shopt -s extglob

# remember EVERYTHING in the history
shopt -s histappend

# complete hostnames
shopt -s hostcomplete

# protect the default file creation mode
umask 077

# some useful aliases
alias bye='exit'
alias c='clear'
alias h='history'
alias ls='ls -p'
alias vi='vim'
alias sudo='sudo ' # elegant solution to preserve aliases across sudo

export PS1 PS2 PS3 PS4 PROMPT_COMMAND

# because OSX and Ubuntu can't agree on the value of $HOSTNAME, we have to derive it
HOST=`hostname -f`

if [ -e $HOME/.bash_local/.bashrc-$HOST ]; then
    source $HOME/.bash_local/.bashrc-$HOST
fi
