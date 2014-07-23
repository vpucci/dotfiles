Dotfiles
========

This repository contains all my dotfiles to set up my environment. To be cloned into the home directory so that the path is `~/dotfiles`. This repository includes a custom script that creates the required symlinks between the home directory dotfiles and the files present in the repository.

The setup script is smart enough to back up your existing dotfiles into a `~/dotfiles_old/` directory if you already have any dotfiles of the same name as the dotfile symlinks being created in your home directory.

This repository uses Bash as the primary shell.

Installation
------------
``` bash
git clone https://vpucci:[password]@github.com/vpucci/dotfiles.git
cd ~/dotfiles
./makesymlinks.sh
```
where `[password]` must be replaced by vpucci's GitHub password.
