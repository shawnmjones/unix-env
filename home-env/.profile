# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash if ~/.bash_profile or ~/.bash_login
# exists, so they will need to be removed from the system for your
# to work.

# set the path to something useful, also avoid "dangerously long paths"
PATH="$PATH:/bin"

# set the history to something outrageous
HISTSIZE=1000

# file listing those entries for hostcomplete
HOSTFILE=$HOME/.hosts

# file for controlling character input
INPUTRC=~/.inputrc

# Unset a timeout for those pesky weak net connections
TMOUT=0

# screencap file for using the screen command
SCREENCAP=~/.screencap

# editor for running svn
SVN_EDITOR=/usr/bin/vim

if [ `id -u` -eq 0 ]; then
    PROMPT_END='# -->'
else
    PROMPT_END='$ -->'
fi

# in the event that we really are a Bourne shell, set these
# prompts so that the user can glean SOME useful information from
# the system
case $TERM in
  screen|screen.linux)
    export PS1="
`whoami`@`hostname`
sh (screen) $PROMPT_END "
    export PS2='> '
    export PS3='$PS2 > '
    export PS4='$PS3 > '
    ;;
  *)
    export PS2='> '
    export PS3='$PS2 > '
    export PS4='$PS3 > '
    export PS1="
`whoami`@`hostname`
sh $PROMPT_END "
    ;;
esac

export PATH HISTSIZE HOSTFILE INPUTRC TMOUT SCREENCAP

# if running bash, source the ~/.bashrc, which may overwrite some of these
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
