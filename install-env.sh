#!/bin/sh

FILES="
.bash_login
.bash_profile
.bashrc
.profile
.tcshrc
.vimrc
.vimcf/R.vim
.vimcf/makefile.vim
.vimcf/php.vim
.vimcf/python.vim
.vimcf/tex.vim
"

DIRS="
.bash_local
.profile_local
.vimcf
.vimbackup
.vimswap
"

for d in $DIRS; do
    echo "Creating directory [$HOME/$d]"
done

for f in $FILES; do
    echo "Installing [home-env/$f] to [$HOME/$f]"
done
