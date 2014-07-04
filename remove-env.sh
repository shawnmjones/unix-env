#!/bin/sh

. "./env-data.sh"

echo "This script is dangerous, do not use unless you want to rip out all of your configs!!!"
echo "uncomment these lines if you need to run it!"
exit 255

for f in $FILES; do
    echo "Removing [$HOME/$f]"
    rm $HOME/$f
done

for d in $DIRS; do
    echo "Removing directory [$HOME/$d]"
    rm -rf $HOME/$d
done


if [ -d $HOME/.envbackup ]; then
    echo "Restoring original copies"

    for f in $FILEs; do

        if [ -e $HOME/.envbackup/$f ]; then
            echo "restoring [$HOME/.envbackup/$f] to [$HOME/$f]"
            cp -R $HOME/.envbackup/$f $HOME/$f
        fi

    done
fi

