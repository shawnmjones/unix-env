#!/bin/sh

scriptdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "${scriptdir}/env-data.sh"

backupdir=`date +'%Y-%m-%dT%H:%M:%S%:z'`

if [ ! -d $HOME/.envbackup/${backupdir} ]; then
    echo "Creating directory to store original copies"
    mkdir -p $HOME/.envbackup/${backupdir}
fi

for f in $FILES; do
    if [ -e $HOME/$f ]; then
        echo "Backing up [$HOME/$f] to [$HOME/.envbackup/$f]"
        cp -R $HOME/$f $HOME/.envbackup/${backupdir}/$f
        rm $HOME/$f
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
    ln -s ${scriptdir}/home-env/$f $HOME/$f
done
