#!/bin/bash
# init.sh
# This script initializes dotfiles:
# - create symlinks from the home directory to any desired dotfiles in ~/dotfiles.
# - install all the vim plugins declared in ~/dotfiles/vimrc.

#==============
# Set Variables 
#==============
# dotfiles directory
dir=~/dotfiles
 # old dotfiles backup directory
olddir=~/dotfiles_old
# list of files/folders to symlink in homedir (to complete)
files="bashrc vimrc tmux.conf"


#===========
# Start init
#===========
# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks from the homedir to any files in the ~/dotfiles directory specified
# in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# install vim plugins
if type -p vim >/dev/null 2>&1; then
    echo "Installing vim plugins"
    vim +PluginInstall +qall
else
    echo "Vim is missing in /usr/bin/"
fi
