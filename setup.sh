#!/bin/bash

SRCDIR=$( dirname $0 )
DESTDIR=`echo ~`

for file in api_keys bash_profile bashrc gitconfig gitignore inputrc profile pylintrc pystartup tm_properties zshenv
do
    ln -fs $SRCDIR/$file $DESTDIR/.$file
done

mkdir -p $DESTDIR/.zsh

for file in zprofile zshrc
do
    ln -fs $SRCDIR/zsh/$file $DESTDIR/.zsh/.$file
done

ln -fs $SRCDIR/zsh/oh-my-zsh $DESTDIR/.zsh/oh-my-zsh

echo "All done!"