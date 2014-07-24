#!/bin/bash
# init.sh
# This script initializes dotfiles:
# - create symlinks from the home directory to any desired dotfiles in ~/dotfiles.
# - install all the vim plugins declared in ~/dotfiles/vimrc.

#==============
# Set Variables 
#==============
# list of files/folders to symlink in homedir (to complete)
files="profile bashrc vimrc tmux.conf"

# dotfiles directory
dir=~/dotfiles
 # old dotfiles backup directory
olddir=~/dotfiles_old
# package manager
if [ "$(uname)" == "Darwin" ]; then
   packman=brew
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
   packman=apt-get
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
   echo "no package manager for Windows hosts"
fi


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

# install vim
if ! type -p vim >/dev/null 2>&1; then
    echo "Installing vim"
    $packman install vim
fi

# install vim plugins
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Installing vim plugins"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

# install tmux
if ! type -p tmux >/dev/null 2>&1; then
    echo "Installing tmux"
    $packman install tmux
fi
