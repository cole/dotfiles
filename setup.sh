#!/bin/bash

SRCDIR=$( dirname $0 )
DESTDIR=`echo ~`

for file in api_keys gitconfig gitignore pylintrc pystartup tm_properties
do
    ln -fs $SRCDIR/$file $DESTDIR/.$file
done

mkdir -p $DESTDIR/.config

ln -fs $SRCDIR/config/fish $DESTDIR/.config/fish

echo "All done!"