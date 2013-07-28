# .bashrc

# this file should be loaded by ~/.profile, and loads any bash-specific settings

# set the prompt to something useful depending on the terminal type
case $TERM in
  screen|screen.linux)
# I want to see when I'm running a screen session
    SH_MAJOR_VER=`echo $BASH_VERSION | sed 's/\([^.]\)*\..*$/\1/g'`
    if [ $SH_MAJOR_VER -lt 3 ]; then
      export PS1='\n\t \u@\h:\w\nbash (screen)\$ --> '
    else
      export PS1='\n\t \u@\h:\w\nbash (screen \l)\$ --> '
    fi
    export PS2='> '
    export PS3='$PS2 > '
    export PS4='$PS3 > '
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
    ;;
  linux)
# linux terminal doesn't need the PROMPT_COMMAND, there're no Windows
    export PS1='\n\t \u@\h:\w\nbash\$ --> '
    export PS2='> '
    export PS3='$PS2 > '
    export PS4='$PS3 > '
    PROMPT_COMMAND=""
    ;;
  *)
# safer and more legible to go with something simple
    export PS1='\n\t \u@\h:\w\nbash \$ --> '
    export PS2='> '
    export PS3='$PS2 > '
    export PS4='$PS3 > '
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
alias pep8='/Library/Frameworks/Python.framework/Versions/Current/lib/python2.7/site-packages/pep8'
alias sudo='sudo ' # elegant solution to preserve aliases across sudo

# aliases specific to Mac
alias gvim='/Applications/MacVim.app/Contents/MacOS/mvim'

# For Java on OSX
JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
ANT_HOME=/Users/smj/Applications/apache-ant-1.8.0
MAVEN_HOME=/Users/smj/Applications/apache-maven-2.2.1
XDOCLET_HOME=/Users/smj/Applications/xdoclet-1.2.3
#JBOSS_HOME=/Users/smj/Applications/jboss-6.0.0.20100216-M2
#JBOSS_HOME=/Users/smj/Applications/jboss-4.0.2
JBOSS_HOME=/Users/smj/Applications/jboss-5.1.0.GA
M2_HOME=/Users/smj/.m2/repository

#PYTHONPATH=$HOME/bin/googlecl/lib/python:$HOME/bin/gdata/lib/python
PYTHONPATH=/usr/lib/python2.7:$PYTHONPATH

PATH=$HOME/bin:/usr/local/texlive/2009/bin/universal-darwin:/Applications/TeX/BibDesk.app/Contents/Resources:/Applications/ImageMagick-6.6.1/bin:$MAVEN_HOME/bin:$ANT_HOME/bin:$JAVA_HOME/bin:$JBOSS_HOME/bin:/opt/subversion/bin:/usr/local/mysql/bin:/opt/wireshark/bin:/bin:/usr/local/bin:/usr/bin:/opt/local/bin:/opt/local/sbin:/usr/local/git/libexec/git-core:$PATH

CLASSPATH=$CLASSPATH:/Applications/Weka/weka-3-6-4/weka.jar

export INPUTRC PATH PROMPT_COMMAND HOSTFILE HISTSIZE TMOUT SCREENCAP JAVA_HOME ANT_HOME XDOCLET_HOME JBOSS_HOME PYTHONPATH CLASSPATH
