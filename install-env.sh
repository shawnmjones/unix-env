#!/bin/sh

. "./env-data.sh"

if [ ! -d $HOME/.envbackup ]; then
    echo "Creating directory to store original copies"
    mkdir -p $HOME/.envbackup
fi

for f in $FILES; do
    if [ -e $HOME/$f ]; then
        echo "Backing up [$HOME/$f] to [$HOME/.envbackup/$f]"
        cp -R $HOME/$f $HOME/.envbackup/$f
    fi
done

for d in $DIRS; do
    echo "Creating directory [$HOME/$d]"

    if [ ! -d $HOME/$d ]; then
        mkdir $HOME/$d
    fi
done

for f in $FILES; do
    echo "Installing [home-env/$f] to [$HOME/$f]"
    ln -s home-env/$f $HOME/$f
done
